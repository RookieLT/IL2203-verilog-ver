`timescale 1ns/1ns
module tb_datapath_3;

parameter M = 3;
parameter N = 8;

//input
reg [N-1 : 0] din;
reg [M-1 : 0] waddr,ra,rb;
reg [2:0] op;
reg ie,write,reada,readb,rst,clk,en,oe,mov_sel;
reg [N-1 : 0] offset;
reg bypassa,bypassb;

//output
wire [N-1 : 0] dout;
wire o_flag,z_flag,n_flag;

datapath #(M,N) dut(din,waddr,ra,rb,op,ie,write,reada,readb,rst,clk,en,oe,offset,bypassa,bypassb,mov_sel,dout,o_flag,z_flag,n_flag);
initial clk=0;
always #2 clk=~clk;

initial begin
    rst<=1;
    #10;
    rst<=0; ie<=0; write<=0; reada<=0; readb<=0; en<=0; oe<=0; bypassa<=0; bypassb<=0;mov_sel<=0;
    #8;
    ie<=1; waddr<=3'b000; din<=8'h01; write<=1;      //write a 2 to reg0
    #4;
    waddr<=3'b001; din<=8'h04;  //write a 4 to reg1
    #4;
    /*
    //may need ir, dout_en, addr_en, flag_sel in the future
    //instru for R type
    ie<=0;write<=0;reada<=0;readb<=0;en<=0;oe<=0;bypassa<=0;bypassb<=0;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b000; //add, upc=0, reserved for instruction fetch
    #4;
    ie<=0;write<=0;reada<=1;readb<=1;en<=0;oe<=0;bypassa<=0;bypassb<=0;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b001; //add,upc=1, read registers 
    #4;
    ie<=0;write<=1;reada<=1;readb<=0;en<=1;oe<=0;bypassa<=0;bypassb<=1;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b011;ra<=3'b000;rb<=3'b001; //add,upc=2, ALU perform addition, rf read pc & write back result
    #4;
    ie<=0;write<=1;reada<=0;readb<=0;en<=1;oe<=1;bypassa<=0;bypassb<=1;op<=3'b111;mov_sel<=0;
    din<='b0;waddr<=3'b111;ra<=3'b000;rb<=3'b001; //add,upc=3, ALU perform pc+1, rf write back pc, output new pc
    #4;
    ie<=0;write<=0;reada<=0;readb<=0;en<=0;oe<=0;bypassa<=0;bypassb<=0;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b001; //add,upc=4, do nothing
    
    #4;
    ie<=0;write<=0;reada<=0;readb<=0;en<=0;oe<=0;bypassa<=0;bypassb<=0;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b000; //add, upc=0, reserved for instruction fetch
    #4;
    ie<=0;write<=0;reada<=1;readb<=1;en<=0;oe<=0;bypassa<=0;bypassb<=0;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b001; //add,upc=1, read registers 
    #4;
    ie<=0;write<=1;reada<=1;readb<=0;en<=1;oe<=0;bypassa<=0;bypassb<=1;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b011;ra<=3'b000;rb<=3'b001; //add,upc=2, ALU perform addition, rf read pc & write back result
    #4;
    ie<=0;write<=1;reada<=0;readb<=0;en<=1;oe<=1;bypassa<=0;bypassb<=1;op<=3'b111;mov_sel<=0;
    din<='b0;waddr<=3'b111;ra<=3'b000;rb<=3'b001; //add,upc=3, ALU perform pc+1, rf write back pc, output new pc
    #4;
    ie<=0;write<=0;reada<=0;readb<=0;en<=0;oe<=0;bypassa<=0;bypassb<=0;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b001; //add,upc=4, do nothing
    

    //instru for I type
    #4;
    ie<=0;write<=0;reada<=0;readb<=0;en<=0;oe<=0;bypassa<=0;bypassb<=0;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b000; //st, upc=0,reserved for instruction fetch
    #4;
    ie<=0;write<=0;reada<=1;readb<=1;en<=0;oe<=0;bypassa<=0;bypassb<=0;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b001; //st, upc=1, read register r1(address),r2(data)
    #4;
    ie<=0;write<=0;reada<=1;readb<=1;en<=1;oe<=1;bypassa<=0;bypassb<=1;op<='b110;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b001; //st, upc=2, read pc,  ALU outputs address
    #4;
    ie<=0;write<=0;reada<=1;readb<=1;en<=1;oe<=1;bypassa<=0;bypassb<=1;op<='b110;mov_sel<=1;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b001; //st, upc=3, read pc, ALU outputs data
    #4;
    ie<=0;write<=1;reada<=0;readb<=0;en<=1;oe<=1;bypassa<=0;bypassb<=1;op<='b111;mov_sel<=0;
    din<='b0;waddr<='b111;ra<=3'b000;rb<=3'b001; //st, upc=4, pc+1, 
    #4;
    ie<=0;write<=0;reada<=0;readb<=0;en<=0;oe<=0;bypassa<=0;bypassb<=0;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b000; //st, upc=0,reserved for instruction fetch
*/
    #4;
    ie<=0;write<=0;reada<=0;readb<=0;en<=0;oe<=0;bypassa<=0;bypassb<=0;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b000; //ldi, upc=0,reserved for instruction fetch
    #4;
    ie<=0;write<=1;reada<=0;readb<=0;en<=1;oe<=0;bypassa<=1;bypassb<=1;op<='b110;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b000; offset<=20;//ldi, upc=1, read pc,write reg, alu output data
    #4;
    ie<=0;write<=1;reada<=0;readb<=0;en<=1;oe<=1;bypassa<=0;bypassb<=1;op<='b111;mov_sel<=0;
    din<='b0;waddr<='b111;ra<=3'b000;rb<=3'b000; //ldi, upc=2 write back pc pc=pc+1,output pc
    #4;
    ie<=0;write<=0;reada<=0;readb<=0;en<=0;oe<=0;bypassa<=0;bypassb<=0;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b000; //ldi, upc=3, idle
    #4;
    ie<=0;write<=0;reada<=0;readb<=0;en<=0;oe<=0;bypassa<=0;bypassb<=0;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b000; //ldi, upc=4, idle
    #4;
    ie<=0;write<=0;reada<=0;readb<=0;en<=0;oe<=0;bypassa<=0;bypassb<=0;op<='b0;mov_sel<=0;
    din<='b0;waddr<='b0;ra<=3'b000;rb<=3'b000; //ldi, upc=0,reserved for instruction fetch
end
endmodule