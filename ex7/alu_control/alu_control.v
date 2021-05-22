module alu_control(ALUOp,i,operation);

input [1:0] ALUOp;
input [31:0] i;

output [3:0] operation;

assign operation[3]=0;
assign operation[0]=ALUOp[1] & ~i[12] & i[13] & i[14];
assign operation[1]=~(ALUOp[1] & i[13] & i[14]);
assign operation[2]=ALUOp[0] |(ALUOp[1]&i[30]);

 

endmodule