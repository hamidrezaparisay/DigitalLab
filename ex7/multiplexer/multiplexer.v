module multiplexer(x,y,s,d);
parameter WIDTH=1;

input [WIDTH-1:0]x,y;
input s;
output [WIDTH-1:0]d;


assign d=(x & {(WIDTH){~s}}) ^ (y & {(WIDTH){s}});

endmodule