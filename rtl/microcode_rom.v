module microcode_rom(input [8:0] a,
                    output reg[] b);
        
        //b = ie, write, reada, readb, en, oe, bypassa, bypassb, uinstru
        always begin
            case(a)
            8'b0000_0000:
            8'b0000_0001:b=00111000000; //add,upc=1, read r2,r3, perform add
            8'b0000_0010:b=01001001111; //add,upc=2, write r1, pc=pc+1
            8'b0000_0011:b=00

        end