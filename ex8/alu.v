module alu(control,data1,data2,out,zero);
input [3:0] control;
input [63:0] data1,data2;
output [63:0] out;
output zero;

wire [63:0] result0,result1;
wire c_out0,c_out1;
reg[63:0] data_temp;
full_adder #(.WIDTH(64)) f(.a(({64{~control[2]}} & data2) | ({64{control[2]}} & (~data2))),.b(64'h0000000000000000),.c_in(control[2] & (1'b1)),.result(result0),.c_out(c_out0));
full_adder #(.WIDTH(64)) f0(.a(data1),.b(result0),.c_in(1'b0),.result(result1),.c_out(c_out1));
assign out=({64{control[0]}} & (data1 | data2)) | ({64{control[1]}} & (result1)) | ({64{~(control[0]^control[1])}} & (data1 & data2));
assign zero= ~(|out);

endmodule