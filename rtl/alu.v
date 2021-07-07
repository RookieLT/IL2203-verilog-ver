module alu #(parameter n = 8)(
            input [n-1 : 0] A,B,
            input [2:0] op,
            input clk,en,rst,
            output reg [n-1 : 0] sum, 
            output reg o_flag,z_flag,n_flag
            );
    reg [n-1 : 0 ] psum;
    reg ro_flag,rz_flag,rn_flag;
    always @(A,B,op) begin
        case(op) 
            0:
            begin 
                psum = A + B;
                ro_flag = (!A[n-1]&!B[n-1]&psum[n-1])|(A[n-1]&B[n-1]&!psum[n-1]);
            end
            1:
            begin
                psum = A - B;
                ro_flag = (!A[n-1]&B[n-1]&psum[n-1])|(A[n-1]&!B[n-1]&!psum[n-1]);
            end
            2:psum = A & B;
            3:psum = A | B;
            4:psum = A ^ B;
            5:psum = ~ A;
            6:psum = A;
            7:psum = A + 1;
            default: psum = 'bx; 
        endcase   
        rz_flag=(|psum==0) ? 1:0;
        rn_flag=psum[n-1];
    end
    always@(posedge clk , posedge rst)begin
        if(rst == 1) begin
            sum <= 'b0;
            o_flag <= 0;
            z_flag <= 0;
            n_flag <= 0;
        end
        else if(en == 1) begin
            sum <= psum;
            o_flag <= ro_flag;
            z_flag <= rz_flag;
            n_flag <= rn_flag;
        end
        else begin
            sum <= sum;
            o_flag <= o_flag;
            z_flag <= z_flag;
            n_flag <= n_flag;
        end
    end
endmodule
    