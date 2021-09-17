`timescale 1ns/1ns
module tb_microcode_fsm;

//input
reg [15:0] din;
reg o_flag,z_flag,n_flag;
reg clk,rst;

//output 
wire [2:0] waddr;
wire [2:0] ra,rb;
wire [2:0] op;
wire ie,write,reada,readb,en,oe,bypassa,bypassb,mov_sel;

microcode_fsm dut(din,o_flag,z_flag,n_flag,clk,rst,waddr,ra,rb,op,ie,write,reada,readb,en,oe,bypassa,bypassb,mov_sel);

initial clk=0;
always #2 clk=~clk;

initial begin
    rst<=1;
    #10 rst <= 0;
    o_flag<=0;
    z_flag<=0;
    n_flag<=0;
    din<=16'b0000_000_001_101_000;
    #10 din<= 16'b1010_001_000111100;
end

endmodule