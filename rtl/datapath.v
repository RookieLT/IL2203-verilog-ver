module datapath #(parameter M=3,
                  parameter N=8)
                  (input [N-1 : 0] din,
                  input [M-1 : 0] waddr,ra,rb,
                  input[2:0] op,
                  input ie,write,reada,readb,rst,clk,en,oe,
                  input [N-1 : 0] offset,
                  input bypassa,bypassb,
                  output [N-1 : 0] dout,
                  output o_flag,z_flag,n_flag
                  );
        wire [N-1 :0] wd;
        wire [N-1 :0] qa,qb,sum;
        wire [M-1 :0] gated_ra;
        wire [N-1 :0] a,b;
        wire gated_reada;
        
        assign gated_ra=(bypassb==1) ? ~0:ra;
        assign gated_reada=bypassb|reada;
        assign wd=(ie==1) ? din:sum;
        assign dout=(oe==1) ? sum:'bx; 
        assign a=(bypassa==1) ? offset:qa;
        assign b=(bypassb==1) ? offset:qb;

        rf #(M,N) rf1(rst,clk,wd,waddr,write,gated_ra,gated_reada,rb,readb,qa,qb);
        alu #(N) alu1(a,b,op,clk,en,rst,sum,o_flag,z_flag,n_flag);
endmodule