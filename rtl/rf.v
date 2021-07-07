module rf #(parameter M=3,
            parameter N=8)
            (input rst,clk,
            
            input[N-1 : 0] wd,     //write data
            input[M-1 : 0] waddr,   //write address
            input write,            //write enable

            input[M-1 : 0] ra,      //read address a
            input reada,            //read enable a

            input [M-1 :0 ] rb ,    //read address b
            input readb,            //read enable b

            output reg [N-1 : 0] qa,    //output value pointed by ra
            output reg [N-1 : 0] qb    //output value pointed by rb
            );
        
        reg [N-1 : 0] register [2**M-1 : 0];
        integer i;
        always @(posedge clk) begin
            if(rst)begin
                for(i=0;i<=2**M-1;i=i+1)
                    register[i][N-1 : 0] <= 'b0;
                qa <= 'b0;
                qb <= 'b0;
            end
            else begin
                if(write)
                    register[waddr] <= wd;
                if(reada)
                    qa <= register[ra];
                else
                    qa <= 'b0;
                if(readb)
                    qb <= register[rb];
                else
                    qb <= 'b0;
            end
        end
endmodule
