`timescale 1ns/1ns
module tb_cpu;

reg clk,rst;

cpu#(3,16) dut(rst,clk);
initial clk = 1;
always #2 clk = !clk;

initial begin 
    rst = 1;
    #20 rst = 0;
end
endmodule