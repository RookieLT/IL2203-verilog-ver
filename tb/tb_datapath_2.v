`timescale 1ns/1ns
module tb_datapath_2;

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
    ie=0;
    write=0;
    reada=0;
    readb=0;
    en=0;
    oe=0;
    bypassa=0;
    bypassb=0;
    #10;
    rst=0;
    ie=1;
    waddr=3'b000;
    din=8'h02; 
    write=1;      //write a 2 to reg0
    #10;
    waddr=3'b001;
    din=8'h03;  //write a 3 to reg1
    #5;
    oe=1;
    ra=3'b000;
    rb=3'b001;
    reada=1;
    readb=1;
    op=3'b000;
    en=1;       //perform 2+3=5
    #10;
    bypassb=1;
    op=3'b111;
    #10;
    bypassa=1;
    op=3'b110;
    offset=8'h55;
end 
endmodule