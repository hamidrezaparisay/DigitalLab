module half_adder(a,b,c_in,result,c_out);
input a,b,c_in;
output result,c_out;
assign result=a^b^c_in;
assign c_out=(a&b) | (a&c_in) | (b&c_in);
endmodule
