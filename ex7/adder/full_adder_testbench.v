module full_adder_test();
reg [3:0]a0;
reg [3:0]b0;
reg c_in0;
wire[3:0] result0;
wire c_out0;

initial
begin
$dumpfile("dump.vcd");
$dumpvars(0,full_adder_test);
#10
a0=4'b1001;
b0=4'b1100;
c_in0=1;
#5
$display("a=%b,b=%b,result=%b,c_out=%b",a0,b0,result0,c_out0);
end
full_adder #(.WIDTH(4)) f(.a(a0),.b(b0),.c_in(c_in0),.result(result0),.c_out(c_out0));
endmodule