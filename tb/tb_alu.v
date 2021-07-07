`timescale 1ns/1ns
module tb_alu;
parameter n = 8;

//input
reg [n-1 : 0] A,B;
reg [2:0] op;
reg clk,en,rst;
//output
wire [n-1 : 0] sum;
wire o_flag,z_flag,n_flag;
initial begin
    clk=0;
    forever
        #5 clk=!clk;
end
initial begin
    rst = 1;
    #10;
    rst = 0;    
    #10;
    op = 0;
    en = 0;
    A = 8'b0000_0001;
    B = 8'b1000_1001; //1+1
     #10;
    en = 1;
    #10;
    en = 0;
    #10;
    A = 8'b0100_0001;
    B = 8'b0100_0001; //overflow
    #10;
    en = 1;
    A = 8'b1100_0001;
    B = 8'b1110_0001;//overflow
    #10;
    A = 8'b0000_0001;
    B = 8'b1111_1111; //zero
    #10;
    op = 1;
    A = 8'b0000_0001;
    B = 8'b0000_0001; //1+1 zero
     #10;
    en = 1;
    #10;
    A = 8'b1111_1111;
    B = 8'b1001_0011;
    #10;
    op = 2;
    A = 8'b0000_0001;
    B = 8'b1000_1001; 
    #10;
    op=3;
    A = 8'b0000_0001;
    B = 8'b1000_1001; 
     #10;
    op = 4;
    A = 8'b0000_0001;
    B = 8'b1000_1001; 
     #10;
    op = 5;
    A = 8'b0000_0001;
    B = 8'b1000_1001; 
     #10;
    op = 6;
    A = 8'b0000_0001;
    B = 8'b1000_1001; 
     #10;
    op = 7;
    A = 8'b0000_0001;
    B = 8'b1000_1001; 
end
alu #(n) dut(A,B,op,clk,en,rst,sum,o_flag,z_flag,n_flag);
endmodule