module tb_rf;

parameter M=3;
parameter N=8;

//input
reg rst,clk;

reg [N-1 : 0] wd;
reg [M-1 : 0] waddr;
reg write;

reg [M-1 : 0] ra;
reg reada;

reg [M-1 : 0 ] rb;
reg readb;

//output
wire [N-1 : 0] qa;
wire [N-1 : 0] qb;

rf #(M,N) dut(rst,clk,wd,waddr,write,ra,reada,rb,readb,qa,qb);
initial clk = 0;
always #5 clk=~clk;

initial begin
    rst = 1;
    #20;
    rst = 0;
    write = 1;
    waddr = 3'b000;
    wd = 8'b0000_0000;
    #10;
    write = 1;
    waddr = 3'b001;
    wd = 8'b0000_0001;
    #10;
    write = 1;
    waddr = 3'b010;
    wd = 8'b0000_0010;
    #10;
    write = 1;
    waddr = 3'b011;
    wd = 8'b0000_0011;
    #10;
    write = 1;
    waddr = 3'b100;
    wd = 8'b0000_0100;
    #10;
    write = 1;
    waddr = 3'b101;
    wd = 8'b0000_0101;
    #10;
    write = 1;
    waddr = 3'b110;
    wd = 8'b0000_0110;
    #10;
    write = 1;
    waddr = 3'b111;
    wd = 8'b0000_011;
    
    #10;
    reada = 1;
    ra = 3'b000;
    readb = 1;
    rb = 3'b001;
    #10;
    rst = 1;
end
endmodule