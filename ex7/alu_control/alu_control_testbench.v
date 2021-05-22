module alu_control2();

reg [31:0]i;
reg [1:0] ALUOp;
wire [3:0] operation;
alu_control s(ALUOp,i,operation);
initial
begin
$dumpfile("dump.vcd");
$dumpvars(0,alu_control2);
#30
i=32'b00000000000000000000000000000000;
ALUOp=2'b10;
#10
$display("Instruction=%b\nALUOp[1]=%b\nALUOp[0]=%b\nOperation=%b\n",
i,ALUOp[1],ALUOp[0],operation);
end
endmodule