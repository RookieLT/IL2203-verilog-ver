module datapath #(parameter M=3,
                  parameter N=16)
                  (input [N-1 : 0] din,
                  input [M-1 : 0] waddr,ra,rb,
                  input[2:0] op,
                  input data_en,addr_en,
                  input ie,write,reada,readb,rst,clk,en,oe,
                  input [N-1 : 0] offset,
                  input bypassa,bypassb,
                  input mov_sel,
                  output [N-1 : 0] addr,
                  output [N-1 : 0] dout,
                  output o_flag,z_flag,n_flag
                  );
        wire [N-1 :0] wd;
        wire [N-1 :0] qa,qb,sum;
        wire [M-1 :0] gated_ra;
        wire [M-1 :0] gated_rb;
        wire [N-1 :0] a,b;
        wire gated_reada;
        wire gated_readb;
        
        assign gated_ra=(bypassb==1) ? ~0:ra;
        assign gated_reada=bypassb|reada;
        assign gated_rb=(bypassb==1) ? ~0:rb;
        assign gated_readb=bypassb|readb;

        assign wd=(ie==1) ? din:sum;
        assign addr = (oe && addr_en) ? sum:'b0;
        assign dout= (oe && data_en) ? sum:'b0; 
        assign a=(bypassa==1) ? offset:qa;
        //assign b=(bypassb==1) ? offset:qb;
        assign b=qb;
        
        rf #(M,N) rf1(rst,clk,wd,waddr,write,gated_ra,gated_reada,gated_rb,gated_readb,qa,qb);
        alu #(N) alu1(a,b,op,clk,en,rst,mov_sel,sum,o_flag,z_flag,n_flag);
endmodule