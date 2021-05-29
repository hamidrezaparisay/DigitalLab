module data_memory(data_address,writeData,memRead,memWrite,dataRead,clk);

input [9:0] data_address;
input [63:0] writeData;
input memRead,memWrite,clk;
output reg [63:0] dataRead;
reg [7:0] aa [1023:0];

always @(posedge clk or negedge clk) begin
	if(memWrite) begin
		aa[data_address]=writeData[31:24];
		aa[data_address+1]=writeData[23:16];
		aa[data_address+2]=writeData[15:8];
		aa[data_address+3]=writeData[7:0];
		$display("writing to data_memory:\n--data_adress:%b\nwriteData:%b",data_address,writeData);
	end
	if(memRead) begin
		dataRead[31:24]=aa[data_address];
		dataRead[23:16]=aa[data_address+1];
		dataRead[15:8]=aa[data_address+2];
		dataRead[7:0]=aa[data_address+3];
		$display("reading from data_memory:\n--data_adress:%b\nreadData:%b",data_address,dataRead);
	end
	else begin
		dataRead=64'h0000000000000000;
	end
end

endmodule