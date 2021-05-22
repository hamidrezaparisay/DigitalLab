module clock_test();
wire clk0;
reg enable0;
clock #(.TIME(10)) s(.enable(enable0),.clk(clk0));
initial
begin
$dumpfile("dump.vcd");
$dumpvars(0,clock_test);
enable0=1;
#5
$display("5:clock=%b",clk0);
#5
$display("10:clock=%b",clk0);
#5
$display("15:clock=%b",clk0);
#5
$display("20:clock=%b",clk0);
#5
$display("25:clock=%b",clk0);
end
endmodule