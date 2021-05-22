module clock(enable,clk);
parameter TIME=10;

input enable;
output reg clk;

initial begin
	clk=0;
end
always @(enable) begin
	while(enable)begin
		#(TIME) clk=~clk;
	end
end
endmodule