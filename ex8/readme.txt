This is a simple simulation of risc-v cpu based from Computer Organization and Design book.
in the book, the scheme just supports R-type instructions,ld and sd instructions so this simulation just support these instructions plus ADDI instruction that I added by myself.
************************************************************** 
3 modules added to the ex7 modules:
-ins_memory
-alu
-data_memory
**************************************************************
You can add instructions in the initial block of ins_memory.v
(currently we load a program that calculate sum=1+2+...+19.the code and details are in code.txt)
**************************************************************
ALU use 2's compiliment numbers.
alu doesnt supprot floating point.
**************************************************************
output of program is 0000000000000000000000000000000000000000000000000000000010111110 in bianary(190 in decimal)
it is saved in memory adress 0110000000