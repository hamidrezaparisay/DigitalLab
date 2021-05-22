module imm_gen2();

reg [31:0]i;

wire [63:0]result;

imm_gen s(i,result);
initial
begin
$dumpfile("dump.vcd");
$dumpvars(0,imm_gen2);
#30
i=32'b10000000000000000000000000000000;
#10
$display("Instruction=%b\n64-bit imm=%b\n",i,result);
end
endmodule