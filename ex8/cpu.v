module cpu();

reg enable;

wire clk;

clock #(.TIME(10)) cl(.enable(enable),.clk(clk));

reg [9:0] pc;
wire [31:0] instruction;
ins_memory im(.ins_address(pc),.ins(instruction));

wire ALUSrc,memtoReg,regWrite,memRead,memWrite,branch;
wire [1:0] ALUOp;
control c(.i(instruction[6:0]),.ALUSrc(ALUSrc),.MemtoReg(memtoReg),.RegWrite(regWrite),.MemRead(memRead),.MemWrite(memWrite),.Branch(branch),.ALUOp(ALUOp));

wire [63:0] readData1,readData2;
wire [63:0] writeData;
registers r(.readRegister1(instruction[19:15]),.readRegister2(instruction[24:20]),.writeRegister(instruction[11:7]),.writeData(writeData),.readData1(readData1),.readData2(readData2),.regWrite(regWrite),.clk(clk));

wire [63:0]imm;
imm_gen i(.i(instruction),.result(imm));

wire [63:0]aluParameter;
multiplexer #(.WIDTH(64)) m_alu(.x(readData2),.y(imm),.s(ALUSrc),.d(aluParameter));

wire [3:0] operation;
alu_control ac(.ALUOp(ALUOp),.i(instruction),.operation(operation));

wire [63:0] aluOut;
wire zero;
alu a(.control(operation),.data1(readData1),.data2(aluParameter),.out(aluOut),.zero(zero));

wire [63:0] dataRead_m;
data_memory dm(.data_address(aluOut[9:0]),.writeData(readData2),.memRead(memRead),.memWrite(memWrite),.dataRead(dataRead_m),.clk(clk));
multiplexer #(.WIDTH(64)) m_data(.x(aluOut),.y(dataRead_m),.s(memtoReg),.d(writeData));

wire [9:0] jump_addr;
wire c_out_0;
full_adder #(.WIDTH(10)) jmp(.a(pc),.b(imm[9:0] << 1),.c_in(1'b0),.result(jump_addr),.c_out(c_out_0));

wire [9:0] next_addr;
wire c_out_1;

full_adder #(.WIDTH(10)) nxt(.a(pc),.b(10'b0000000100),.c_in(1'b0),.result(next_addr),.c_out(c_out_1));

wire [9:0] addr;
multiplexer #(.WIDTH(10)) m_addr(.x(next_addr),.y(jump_addr),.s(branch & zero),.d(addr));

initial begin
$dumpfile("dump.vcd");
$dumpvars(0,cpu);
enable=1;
pc=0;
#1000
enable=0;

end

always@ (posedge clk or negedge clk)
begin
if(enable)begin
	pc=addr;
end
end

endmodule