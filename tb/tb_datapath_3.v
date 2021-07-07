`timescale 1ns/1ns
module tb_datapath_3;

parameter M = 3;
parameter N = 8;

//input
reg [N-1 : 0] din;
reg [M-1 : 0] waddr,ra,rb;
reg [2:0] op;
reg ie,write,reada,readb,rst,clk,en,oe;
reg [N-1 : 0] offset;
reg bypassa,bypassb;

//output
wire [N-1 : 0] dout;
wire o_flag,z_flag,n_flag;

datapath #(M,N) dut(din,waddr,ra,rb,op,ie,write,reada,readb,rst,clk,en,oe,offset,bypassa,bypassb,dout,o_flag,z_flag,n_flag);
initial clk=0;
always #2 clk=~clk;

initial begin
    rst=1;
    #12;
    rst=0; ie=0; write=0; reada=0; readb=0; en=0; oe=0; bypassa=0; bypassb=0;
    #8;
    ie=1; waddr=3'b000; din=8'h02; write=1;      //write a 2 to reg0
    #4;
    waddr=3'b001; din=8'h03;  //write a 3 to reg1
    #4;
    ie=0;write=0;reada=0;readb=0;en=0;oe=0;bypassa=0;bypassb=0;op='b0;
    din='b0;waddr='b0;ra='b0;rb='b0; //upc=0
    #4;
    ie=0;write=0;reada=1;readb=1;en=1;oe=0;bypassa=0;bypassb=0;op='b0;
    din='b0;waddr='b0;ra=3'b000;rb=3'b001; //upc=1
    #4;
    ie=0;write=1;reada=0;readb=0;en=1;oe=0;bypassa=0;bypassb=1;op=3'b111;
    din='b0;waddr=3'b011;ra=3'b000;rb=3'b001; //upc=2
    #4;
    ie=0;write=0;reada=0;readb=0;en=0;oe=1;bypassa=0;bypassb=0;op='b0;
    din='b0;waddr='b0;ra=3'b000;rb=3'b001; //upc=3
end
endmodule