`timescale 1ns/1ns
module tb_alu1;

reg [7:0] a,b;
reg [2:0] op;
reg clk,en,rst;

wire [7:0] sum;
wire o_flag,z_flag,n_flag;

alu #(8) dut (a,b,op,clk,en,rst,sum,o_flag,z_flag,n_flag);

initial clk=1;
always #2 clk=~clk;

initial begin
    rst=1;
    #4;
    rst=0;
    a='b0;
    b='b0;
    op='b0;
    en=0;
    #4;
    rst=0;
    a=2;
    b=4;
    op='b0;
    en=1;
    #4;
    rst=0;
    a=0;
    b='bx;
    op=3'b111;
    en=1;
    #4;
    rst=0;
    a=0;
    b=0;
    op=0;
    en=1;
end
endmodule
