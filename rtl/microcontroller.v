module microcontroller#(parameter M=3,
                      parameter N=16)
                      (input [15:0] din,
                       input clk,rst,
                       output rw,
                       output [N-1:0] addr,
                       output [N-1:0] dout);
        
        wire [2:0] waddr;
        wire [2:0] ra,rb;
        wire [2:0] op;
        wire [N-1:0] offset;
        wire data_en,addr_en,ie,write,reada,readb,en,oe,bypassa,bypassb,mov_sel;
        wire o_flag,z_flag,n_flag;

        microcode_fsm #(M, N) fsm(din,o_flag,z_flag,n_flag,clk,rst,waddr,ra,rb,op,offset,
                            rw,data_en,addr_en,ie,write,reada,readb,en,oe,bypassa,bypassb,mov_sel);
        datapath #(M, N)dp(din,waddr,ra,rb,op,data_en,addr_en,ie,write,reada,readb,rst,clk,en,oe,
                    offset,bypassa,bypassb,mov_sel,addr,dout,o_flag,z_flag,n_flag);
        
endmodule 