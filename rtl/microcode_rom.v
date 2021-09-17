module microcode_rom(input [8:0] a,
                    input [2:0] waddr_in,
                    output reg[17:0] b,
                    output reg[2:0] waddr_out);
        
        //b = RW,data_en,addr_en,_ ie, write, reada, readb,_ en, oe, bypassa, bypassb,_ uinstru,_ mov_sel, ir, flag_sel
        always @(a)begin
            case(a)
/*=====================================================ADD===================================================*/
                8'b0000_0_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //add, upc=0, reserved for instruction fetch
                8'b0000_0_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//add,upc=1, read registers 
                8'b0000_0_011:  begin 
                                b=18'b000_0110_1001_000_0000; 
                                waddr_out=waddr_in;
                                end//add,upc=2, ALU perform addition, rf read pc & write back result
                8'b0000_0_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//add,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0000_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//add,upc=4, do nothing
                8'b0000_1_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //add, upc=0, reserved for instruction fetch
                8'b0000_1_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//add,upc=1, read registers 
                8'b0000_1_011:  begin 
                                b=18'b000_0110_1001_000_0000; 
                                waddr_out=waddr_in;
                                end//add,upc=2, ALU perform addition, rf read pc & write back result
                8'b0000_1_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//add,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0000_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//add,upc=4, do nothing
/*=====================================================SUB===================================================*/
                8'b0001_0_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //SUB, upc=0, reserved for instruction fetch
                8'b0001_0_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//SUB,upc=1, read registers 
                8'b0001_0_011:  begin 
                                b=18'b000_0110_1001_001_0000; 
                                waddr_out=waddr_in;
                                end//SUB,upc=2, ALU perform subtraction, rf read pc & write back result
                8'b0001_0_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//SUB,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0001_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//SUB,upc=4, do nothing   
                8'b0001_1_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //SUB, upc=0, reserved for instruction fetch
                8'b0001_1_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//SUB,upc=1, read registers 
                8'b0001_1_011:  begin 
                                b=18'b000_0110_1001_001_0000; 
                                waddr_out=waddr_in;
                                end//SUB,upc=2, ALU perform subtraction, rf read pc & write back result
                8'b0001_1_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//SUB,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0001_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//SUB,upc=4, do nothing   
/*=====================================================AND===================================================*/
                8'b0010_0_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //and, upc=0, reserved for instruction fetch
                8'b0010_0_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//and,upc=1, read registers 
                8'b0010_0_011:  begin 
                                b=18'b000_0110_1001_010_0000; 
                                waddr_out=waddr_in;
                                end//and,upc=2, ALU perform and, rf read pc & write back result
                8'b0010_0_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//and,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0010_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//and,upc=4, do nothing   
                8'b0010_1_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //and, upc=0, reserved for instruction fetch
                8'b0010_1_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//and,upc=1, read registers 
                8'b0010_1_011:  begin 
                                b=18'b000_0110_1001_010_0000; 
                                waddr_out=waddr_in;
                                end//and,upc=2, ALU perform and, rf read pc & write back result
                8'b0010_1_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//and,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0010_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//and,upc=4, do nothing   
/*=====================================================OR===================================================*/
                8'b0011_0_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //OR, upc=0, reserved for instruction fetch
                8'b0011_0_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//OR,upc=1, read registers 
                8'b0011_0_001:  begin 
                                b=18'b000_0110_1001_011_0000; 
                                waddr_out=waddr_in;
                                end//OR,upc=2, ALU perform OR, rf read pc & write back result
                8'b0011_0_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//OR,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0011_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//OR,upc=4, do nothing   
                8'b0011_1_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //OR, upc=0, reserved for instruction fetch
                8'b0011_1_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//OR,upc=1, read registers 
                8'b0011_1_011:  begin 
                                b=18'b000_0110_1001_011_0000; 
                                waddr_out=waddr_in;
                                end//OR,upc=2, ALU perform OR, rf read pc & write back result
                8'b0011_1_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//OR,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0011_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//OR,upc=4, do nothing   
/*=====================================================XOR===================================================*/
                8'b0100_0_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //XOR, upc=0, reserved for instruction fetch
                8'b0100_0_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//XOR,upc=1, read registers 
                8'b0100_0_011:  begin 
                                b=18'b000_0110_1001_100_0000; 
                                waddr_out=waddr_in;
                                end//XOR,upc=2, ALU perform XOR, rf read pc & write back result
                8'b0100_0_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//XOR,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0100_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//XOR,upc=4, do nothing   
                8'b0100_1_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //XOR, upc=0, reserved for instruction fetch
                8'b0100_1_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//XOR,upc=1, read registers 
                8'b0100_1_011:  begin 
                                b=18'b000_0110_1001_100_0000; 
                                waddr_out=waddr_in;
                                end//XOR,upc=2, ALU perform XOR, rf read pc & write back result
                8'b0100_1_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//XOR,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0100_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//XOR,upc=4, do nothing  
/*=====================================================NOT===================================================*/
                8'b0101_0_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //NOT, upc=0, reserved for instruction fetch
                8'b0101_0_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//NOT,upc=1, read registers 
                8'b0101_0_011:  begin 
                                b=18'b000_0110_1001_101_0000; 
                                waddr_out=waddr_in;
                                end//NOT,upc=2, ALU perform NOT, rf read pc & write back result
                8'b0101_0_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//NOT,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0101_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//NOT,upc=4, do nothing   
                8'b0101_1_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //NOT, upc=0, reserved for instruction fetch
                8'b0101_1_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//NOT,upc=1, read registers 
                8'b0101_1_011:  begin 
                                b=18'b000_0110_1001_101_0000; 
                                waddr_out=waddr_in;
                                end//NOT,upc=2, ALU perform NOT, rf read pc & write back result
                8'b0101_1_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//NOT,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0101_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//NOT,upc=4, do nothing  
/*=====================================================MOV===================================================*/
                8'b0110_0_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //MOV, upc=0, reserved for instruction fetch
                8'b0110_0_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//MOV,upc=1, read registers 
                8'b0110_0_011:  begin 
                                b=18'b000_0110_1001_110_0000; 
                                waddr_out=waddr_in;
                                end//MOV,upc=2, ALU perform NOT, rf read pc & write back result
                8'b0110_0_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//MOV,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0110_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//MOV,upc=4, do nothing   
                8'b0110_1_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //MOV, upc=0, reserved for instruction fetch
                8'b0110_1_010:  begin 
                                b=18'b000_0011_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//MOV,upc=1, read registers 
                8'b0110_1_011:  begin 
                                b=18'b000_0110_1001_110_0000; 
                                waddr_out=waddr_in;
                                end//MOV,upc=2, ALU perform NOT, rf read pc & write back result
                8'b0110_1_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//MOV,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0110_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//MOV,upc=4, do nothing  
/*=====================================================NOP===================================================*/
                8'b0111_0_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //MOV, upc=0, reserved for instruction fetch
                8'b0111_0_010:  begin 
                                b=18'b000_0000_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//MOV,upc=1, DO NOTHING
                8'b0111_0_011:  begin 
                                b=18'b000_0010_1001_000_0000; 
                                waddr_out=waddr_in;
                                end//MOV,upc=2, ALU perform NOTHING, rf read pc 
                8'b0111_0_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//MOV,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0111_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//MOV,upc=4, do nothing   
                8'b0111_1_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //MOV, upc=0, reserved for instruction fetch
                8'b0111_1_010:  begin 
                                b=18'b000_0000_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//MOV,upc=1, 
                8'b0111_1_011:  begin 
                                b=18'b000_0010_1001_000_0000; 
                                waddr_out=waddr_in;
                                end//MOV,upc=2, ALU perform NOT, rf read pc & write back result
                8'b0111_1_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//MOV,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b0111_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//MOV,upc=4, do nothing  
/*=====================================================LD===================================================*/
                8'b1000_0_000:  begin
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end//LD upc=0 instruction fetch
                8'b1000_0_010:  begin
                                b=18'b000_0010_0000_000_0000;
                                waddr_out=waddr_in;
                                end//LD upc=1 read register
                8'b1000_0_011:  begin
                                b=18'b001_1110_1101_110_0000;
                                waddr_out=waddr_in;
                                end//LD upc=2 ALU output address,write back data read pc
                8'b1000_0_100:  begin
                                b=18'b001_0100_1101_111_0000;
                                waddr_out={3{1'b1}};
                                end//LD upc=3 ALU pc+1  write back pc
                8'b1000_0_001:  begin
                                b=18'b000_0000_0000_000_0000;
                                waddr_out=waddr_in;
                                end//LD upc=4
                8'b1000_1_000:  begin
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end//LD upc=0 instruction fetch
                8'b1000_1_010:  begin
                                b=18'b000_0010_0000_000_0000;
                                waddr_out=waddr_in;
                                end//LD upc=1 read register
                8'b1000_1_011:  begin
                                b=18'b001_1110_1101_110_0000;
                                waddr_out=waddr_in;
                                end//LD upc=2 ALU output address,write back data read pc
                8'b1000_1_100:  begin
                                b=18'b001_0100_1101_111_0000;
                                waddr_out={3{1'b1}};
                                end//LD upc=3 ALU pc+1  write back pc
                8'b1000_1_001:  begin
                                b=18'b000_0000_0000_000_0000;
                                waddr_out=waddr_in;
                                end//LD upc=4
 /*=====================================================ST===================================================*/                               
                8'b1001_0_000:  begin
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end//ST upc=0 instruction fetch
                8'b1001_0_001:  begin
                                b=18'b000_0011_0000_000_0000;
                                waddr_out=waddr_in;
                                end//ST upc=1 read registers
                8'b1001_0_010:  begin
                                b=18'b001_0011_1100_110_0000;
                                waddr_out=waddr_in;
                                end//ST upc=2 ALU output address, read registers
                8'b1001_0_011:  begin
                                b=18'b010_0010_1101_110_1000;
                                waddr_out=waddr_in;
                                end//ST upc=3 ALU output DATA, read pc
                8'b1001_0_100:  begin
                                b=18'b001_0100_1100_111_0000;
                                waddr_out={3{1'b1}};
                                end//ST upc=4 write back pc write back pc
                8'b1001_1_000:  begin
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end//ST upc=0 instruction fetch
                8'b1001_1_001:  begin
                                b=18'b000_0011_0000_000_0000;
                                waddr_out=waddr_in;
                                end//ST upc=1 read registers
                8'b1001_1_010:  begin
                                b=18'b001_0011_1100_110_0000;
                                waddr_out=waddr_in;
                                end//ST upc=2 ALU output address, read registers
                8'b1001_1_011:  begin
                                b=18'b010_0010_1101_110_1000;
                                waddr_out=waddr_in;
                                end//ST upc=3 ALU output DATA, read pc
                8'b1001_1_100:  begin
                                b=18'b001_0100_1100_111_0000;
                                waddr_out={3{1'b1}};
                                end//ST upc=4 write back pc write back pc
 /*=====================================================LDI===================================================*/ 
                8'b1010_0_000:  begin
                                b=18'b000_0000_0000_000_0100; 
                                waddr_out=waddr_in;
                                end//ldi, upc=0
                8'b1010_0_011:  begin
                                b=18'b000_0100_1011_110_0000; 
                                waddr_out=waddr_in;
                                end//ldi, upc=1 read pc,write reg, alu output data
                8'b1010_0_100:  begin
                                b=18'b001_0100_1101_111_0000;
                                waddr_out={3{1'b1}};
                                end//ldi, upc=2 write back pc pc=pc+1,output pc
                8'b1010_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//ldi, upc=3, idle
                8'b1010_0_010:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//ldi, upc=3, idle
                8'b1010_1_000:  begin
                                b=18'b000_0000_0000_000_0100; 
                                waddr_out=waddr_in;
                                end//ldi, upc=0
                8'b1010_1_011:  begin
                                b=18'b000_0100_1011_110_0000; 
                                waddr_out=waddr_in;
                                end//ldi, upc=1 read pc,write reg, alu output data
                8'b1010_1_100:  begin
                                b=18'b001_0100_1101_111_0000;
                                waddr_out={3{1'b1}};
                                end//ldi, upc=2 write back pc pc=pc+1,output pc
                8'b1010_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//ldi, upc=3, idle
                8'b1010_1_010:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//ldi, upc=3, idle
 /*=====================================================NU===================================================*/
                8'b1011_0_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //MOV, upc=0, reserved for instruction fetch
                8'b1011_0_010:  begin 
                                b=18'b000_0000_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//MOV,upc=1, DO NOTHING
                8'b1011_0_011:  begin 
                                b=18'b000_0010_1001_000_0000; 
                                waddr_out=waddr_in;
                                end//MOV,upc=2, ALU perform NOTHING, rf read pc 
                8'b1011_0_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//MOV,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b1011_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//MOV,upc=4, do nothing   
                8'b1011_1_000:  begin 
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //MOV, upc=0, reserved for instruction fetch
                8'b1011_1_010:  begin 
                                b=18'b000_0000_0000_000_0000; 
                                waddr_out=waddr_in;
                                end//MOV,upc=1, 
                8'b1011_1_011:  begin 
                                b=18'b000_0010_1001_000_0000; 
                                waddr_out=waddr_in;
                                end//MOV,upc=2, ALU perform NOT, rf read pc & write back result
                8'b1011_1_100:  begin 
                                b=18'b001_0100_1101_111_0000; 
                                waddr_out={3{1'b1}};
                                end//MOV,upc=3, ALU perform pc+1, rf write back pc, output new pc
                8'b1011_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//MOV,upc=4, do nothing  
 /*=====================================================BRZ===================================================*/
                8'b1100_0_000:  begin
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //BRZ, upc=0, reserved for instruction fetch
                8'b1100_0_010:  begin
                                b=18'b000_0000_0000_000_0001;
                                waddr_out=waddr_in;
                                end //BRZ, upc=1, choose flag
                8'b1100_0_011:  begin
                                b=18'b000_0010_0001_000_0001; 
                                waddr_out=waddr_in;
                                end //BRZ, upc=2, read pc
                8'b1100_0_100:  begin
                                b=18'b001_0100_1100_111_0001;
                                waddr_out={3{1'b1}};
                                end    //BRZ, upc=3, pc+1 write back    
                8'b1100_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//BRZ,upc=4, do nothing
                8'b1100_1_000:  begin
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //BRZ, upc=0, reserved for instruction fetch
                8'b1100_1_010:  begin
                                b=18'b000_0000_0000_000_0001;
                                waddr_out=waddr_in;
                                end //BRZ, upc=1, choose flag
                8'b1100_1_011:  begin
                                b=18'b000_0001_0001_000_0001; 
                                waddr_out=waddr_in;
                                end //BRZ, upc=2, read pc
                8'b1100_1_100:  begin
                                b=18'b001_0100_1110_000_0001;
                                waddr_out={3{1'b1}};
                                end    //BRZ, upc=3, pc+offset write back    
                8'b1100_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//BRZ,upc=4, do nothing                                    
 /*=====================================================BRN===================================================*/
                8'b1101_0_000:  begin
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //BRN, upc=0, reserved for instruction fetch
                8'b1101_0_010:  begin
                                b=18'b000_0000_0000_000_0010;
                                waddr_out=waddr_in;
                                end //BRN, upc=1, choose flag
                8'b1101_0_011:  begin
                                b=18'b000_0010_0001_000_0010; 
                                waddr_out=waddr_in;
                                end //BRN, upc=2, read pc
                8'b1101_0_100:  begin
                                b=18'b001_0100_1100_111_0010;
                                waddr_out={3{1'b1}};
                                end //BRN, upc=3, pc+1 write back    
                8'b1101_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//BRN,upc=4, do nothing
                8'b1101_1_000:  begin
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //BRN, upc=0, reserved for instruction fetch
                8'b1101_1_010:  begin
                                b=18'b000_0000_0000_000_0010;
                                waddr_out=waddr_in;
                                end //BRN, upc=1, choose flag
                8'b1101_1_011:  begin
                                b=18'b000_0001_0001_000_0010; 
                                waddr_out=waddr_in;
                                end //BRN, upc=2, read pc
                8'b1101_1_100:  begin
                                b=18'b001_0100_1110_000_0010;
                                waddr_out={3{1'b1}};
                                end    //BRN, upc=3, pc+offset write back    
                8'b1101_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//BRN,upc=4, do nothing                           
 /*=====================================================BRO===================================================*/
                8'b1110_0_000:  begin
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //BRN, upc=0, reserved for instruction fetch
                8'b1110_0_010:  begin
                                b=18'b000_0000_0000_000_0000;
                                waddr_out=waddr_in;
                                end //BRN, upc=1, choose flag
                8'b1110_0_011:  begin
                                b=18'b000_0010_0001_000_0000; 
                                waddr_out=waddr_in;
                                end //BRN, upc=2, read pc
                8'b1110_0_100:  begin
                                b=18'b001_0100_1100_111_0000;
                                waddr_out={3{1'b1}};
                                end //BRN, upc=3, pc+1 write back    
                8'b1110_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//BRN,upc=4, do nothing
                8'b1110_1_000:  begin
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //BRN, upc=0, reserved for instruction fetch
                8'b1110_1_010:  begin
                                b=18'b000_0000_0000_000_0000;
                                waddr_out=waddr_in;
                                end //BRN, upc=1, choose flag
                8'b1110_1_011:  begin
                                b=18'b000_0001_0001_000_0000; 
                                waddr_out=waddr_in;
                                end //BRN, upc=2, read pc
                8'b1110_1_100:  begin
                                b=18'b001_0100_1110_000_0000;
                                waddr_out={3{1'b1}};
                                end    //BRN, upc=3, pc+offset write back    
                8'b1110_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//BRN,upc=4, do nothing           
 /*=====================================================BRA===================================================*/
                8'b1111_0_000:  begin
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //BRA, upc=0, reserved for instruction fetch
                8'b1111_0_010:  begin
                                b=18'b000_0000_0000_000_0000;
                                waddr_out=waddr_in;
                                end //BRA, upc=1, choose flag
                8'b1111_0_011:  begin
                                b=18'b000_0001_0001_000_0000; 
                                waddr_out=waddr_in;
                                end //BRA, upc=2, read pc
                8'b1111_0_100:  begin
                                b=18'b001_0100_1110_000_0000;
                                waddr_out={3{1'b1}};
                                end    //BRA, upc=3, pc+offset write back    
                8'b1111_0_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//BRA,upc=4, do nothing     
                8'b1111_1_000:  begin
                                b=18'b000_0000_0000_000_0100;
                                waddr_out=waddr_in;
                                end //BRA, upc=0, reserved for instruction fetch
                8'b1111_1_010:  begin
                                b=18'b000_0000_0000_000_0000;
                                waddr_out=waddr_in;
                                end //BRA, upc=1, choose flag
                8'b1111_1_011:  begin
                                b=18'b000_0001_0001_000_0000; 
                                waddr_out=waddr_in;
                                end //BRA, upc=2, read pc
                8'b1111_1_100:  begin
                                b=18'b001_0100_1110_000_0000;
                                waddr_out={3{1'b1}};
                                end    //BRA, upc=3, pc+offset write back    
                8'b1111_1_001:  begin
                                b='b0;
                                waddr_out=waddr_in;
                                end//BRA,upc=4, do nothing           
               default:        begin
                                b='b0;
                                waddr_out=waddr_in;
                                end
            endcase
        end
endmodule