module control2();

reg [6:0]i;

wire ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch;
wire [1:0] ALUOp;
control s(i,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp);
initial
begin
$dumpfile("dump.vcd");
$dumpvars(0,control2);
#30
i=7'b0110011;
#10
$display("Instruction[0 to 6]=%b\nALUSrc=%b\nMemtoReg=%b\nRegWrite=%b\nMemRead=%b\nMemtoReg=%b\nBranch=%b\nALUOp1=%b\nALUOp0=%b\n",
i,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp[1],ALUOp[0]);
end
endmodule