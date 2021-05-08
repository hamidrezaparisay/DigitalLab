module multiplexer(x,y,s,d);

input [63:0]x,y;
input s;
output [63:0]d;

assign d=(x & {64{~s}}) ^ (y & {64{s}});

endmodule