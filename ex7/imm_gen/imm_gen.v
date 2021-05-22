module imm_gen(i,result);


input [31:0]i;

output [63:0]result;
assign result[63:0]={{52{i[31]}},i[31:20]};

endmodule