module cpu#(parameter M=3,
            parameter N=16)
            (input rst,clk);
    wire [15 : 0] din;
    wire [15 : 0] addr;
    wire [8 : 0] addr_in;
    wire [15:0] dout;
 
    assign addr_in = addr[8:0];

    microcontroller #(M,N) ctrlr (din,clk,rst,rw,addr,dout);
    fake_memory mem(clk,rw,dout,addr_in,din);
endmodule