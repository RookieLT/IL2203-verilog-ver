`timescale 1ns/1ns
module tb_datapath;

parameter M=3;
parameter N=8;
reg [N-1 : 0] din;
reg [M-1 : 0] waddr,ra,rb;
reg [2:0] op;
reg ie,write,reada,readb,rst,clk,en,oe;

wire [N-1 : 0] dout;
wire o_flag,z_flag,n_flag;

initial clk=0;
always #2 clk=~clk;

datapath #(M,N) dut (din,waddr,ra,rb,op,ie,write,reada,readb,rst,clk,en,oe,dout,o_flag,z_flag,n_flag);
initial begin
    rst = 1;
    #10;
    rst = 0;
    ie = 1;
    write = 1;
    din = 8'b0000_0001;
    waddr = 3'b000;
    #10;
    ie = 0;
    reada = 1;
    ra = 3'b000;
    readb = 1;
    rb = 3'b001;
    op = 3'b000;
    en=1;
    oe = 1;
    write = 1;
    waddr = 3'b001;
end
endmodule