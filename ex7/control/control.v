module control(i,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp);


input [6:0]i;

output ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch;
output [1:0] ALUOp;

assign ALUSrc=~i[4] & ~i[6];
assign MemtoReg=~i[4];
assign RegWrite=~(i[5] ^ i[4]);
assign MemRead=~i[5];
assign MemWrite=~i[4] & i[5] & ~i[6];
assign Branch=i[6];
assign ALUOp[0]=i[6];
assign ALUOp[1]=i[4]; 

endmodule