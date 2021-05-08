module multiplexer2();
reg [63:0]x0,y0;
reg s0;
wire [63:0]dd;

initial
begin
$dumpfile("dump.vcd");
$dumpvars(0,multiplexer2);

x0=64'hffffffffffffffff;
y0=64'h0000000000000000;

#30 
s0=0;
#5 
$display("x=%h,y=%h,s=%b\ncorrect_answer=0xffffffffffffffff\nsimulated_answer=0x%h\n",x0,y0,s0,dd);
#1
if(dd!=64'hffffffffffffffff)
   $display("simulated answer is wrong!");

#30
s0=1; 
#5 
$display("x=%h,y=%h,s=%b\ncorrect_answer=0x0000000000000000\nsimulated_answer=0x%h\n",x0,y0,s0,dd);
#1
if(dd!=64'h0000000000000000)
   $display("simulated answer is wrong!");

end
multiplexer s(.d(dd),.x(x0),.y(y0),.s(s0));
endmodule