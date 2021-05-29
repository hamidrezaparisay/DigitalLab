module imm_gen(i,result);


input [31:0]i;

output reg [63:0]result;

always @(i) begin
if(~i[6] & ~i[5])begin
	result[63:0]={{52{i[31]}},i[31:20]};
end
if(~i[6] & i[5])begin
	result[63:0]={{52{i[31]}},i[31:20],i[11:7]};
end
if(i[6] & i[5])begin
	result[63:0]={{51{i[31]}},i[31],i[7],i[30:25],i[11:8],1'b0};
end
end

endmodule