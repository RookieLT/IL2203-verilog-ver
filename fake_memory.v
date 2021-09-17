module fake_memory(input clk,
                    input rn,wn,
                    input [15:0] din,
                    input [8:0] addr,
                    output [15:0] dout);
    reg [15:0] mem [8:0];
    integer i;
    initial begin
        mem[0]=16'b1010_101_100000000;
        mem[1]=16'b0000_101_101_101_000;
        mem[2]=16'b0000_101_101_101_000;
        mem[3]=16'b0000_101_101_101_000;
        mem[4]=16'b0000_101_101_101_000;
        mem[5]=16'b1010_110_000100000;
        mem[6]=16'b1010_011_000000011;
        mem[7]=16'b1001_110_011_000000;
        mem[8]=16'b1010_001_000000001;
        mem[9]=16'b1010_000_000001110;
        mem[10]=16'b0110_010_000_000000;
        mem[11]=16'b0000_010_010_001_000;
        mem[12]=16'b0001_000_000_001_000;
        mem[13]=16'b1100_0000_0000_0011;
        mem[14]=16'b0111_0000_0000_0000;
        mem[15]=16'b1111_0000_1111_1100;
        mem[16]=16'b1001_110_010_000000;
        mem[17]=16'b1001_101_010_000000;
        mem[18]=16'b1111_0000_0000_0000;
        mem[19]=16'b0111_0000:0000:0000;
        mem[20]=16'b0111_0000:0000:0000;
        for(i=21;i<=256;i=i+1)begin
            mem[i]='b0;
        end
    end
    always @(posedge clk) begin
        if (rn & !wn) begin
            dout <= mem[addr];
        end
        else if(!rn & wn) begin
            mem[addr] <= din;
        else
            dout <='bx;
        end
    end
endmodule