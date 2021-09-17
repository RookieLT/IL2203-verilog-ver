`timescale 1ns/1ns
module tb_alu1;

reg [15:0] A,B;
reg [2:0] op;
reg clk,en,rst;
reg mov_sel;

wire [15:0] sum;
wire o_flag,z_flag,n_flag;

alu #(16) dut (A,B,op,clk,en,rst,mov_sel,sum,o_flag,z_flag,n_flag);

initial clk=1;
always #2 clk=~clk;

initial begin
    rst <= 1;
    #10;
    rst <= 0;
    A <= 'b0;
    B <= 'b0;
    op <= 'b0;
    mov_sel <= 0;
    en <= 0;

    #20;
    A <= 16'b1111_1111_0000_0000;
    B <= 16'b0000_0000_0000_0010;
    op <= 3'b001;
    en <= 1;

    #20;
    A <= 16'b0000_0000_0100_1110;
    B <= 16'b0000_0000_0100_1110;
    op <= 3'b111;
    en <= 1;

    #20;
    A <= 'b0;
    B <= 'b0;
    op <= 'b0;
    en <= 0;

    #20;
    A <= 16'b1111_1111_0000_0000;
    B <= 16'b0000_0000_0000_0010;
    op <= 3'b100;
    en <= 1;

    #20;
    A <= 16'b0000_0000_0000_0111;
    B <= 16'b0000_0000_0000_0111;
    op <= 3'b111;
    en <= 1;
end
endmodule
