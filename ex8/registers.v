module registers(readRegister1,readRegister2,writeRegister,writeData,readData1,readData2,regWrite,clk);

input clk,regWrite;
input [4:0] readRegister1,readRegister2,writeRegister;
input [63:0]writeData;

output [63:0] readData1,readData2;
reg [63:0] a [31:0];

assign readData1=a[readRegister1];
assign readData2=a[readRegister2];

initial begin
	a[0]=64'h0000000000000000;
end
always @(posedge clk or negedge clk) begin
	if(regWrite) begin
		if(writeRegister !=0) begin
			a[writeRegister]=writeData;
		end
	end
end

endmodule