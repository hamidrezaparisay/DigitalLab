module full_adder(a,b,c_in,result,c_out);
parameter WIDTH=1;

input [WIDTH-1:0] a;
input [WIDTH-1:0] b;
input c_in;
output [WIDTH-1:0] result;
output c_out;
wire [WIDTH:0] c_out_temp;
genvar i;
assign c_out_temp[0]=c_in;
generate
for(i=0;i<WIDTH;i=i+1) 
begin : make_hadders
	half_adder s(a[i],b[i],c_out_temp[i],result[i],c_out_temp[i+1]);
	
end
endgenerate
assign c_out=c_out_temp[WIDTH];
endmodule