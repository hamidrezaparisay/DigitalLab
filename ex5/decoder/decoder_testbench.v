module decoder2();
reg x0,y0,z0,w0,enable0;
wire [15:0]dd;

initial
begin
$dumpfile("dump.vcd");
$dumpvars(0,decoder2);

#30 
x0=0;y0=0;z0=0;w0=0;enable0=1;
#5 
$display("x=%b,y=%b,z=%b,w=%b\ncorrect_answer=10000000000000000\nsimulated_answer=%b\n",x0,y0,z0,w0,dd);
#1
if(dd!=16'b1000000000000000)
   $display("simulated answer is wrong!");

#30 
x0=0;y0=0;z0=1;w0=1;
#5 
$display("x=%b,y=%b,z=%b,w=%b\ncorrect_answer=0001000000000000\nsimulated_answer=%b\n",x0,y0,z0,w0,dd);
#1
if(dd!=16'b0001000000000000)
   $display("simulated answer is wrong!");

end
decoder s(.d(dd),.enable(enable0),.x(x0),.y(y0),.z(z0),.w(w0));
endmodule