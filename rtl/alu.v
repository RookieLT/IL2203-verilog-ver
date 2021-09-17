module alu #(parameter n = 8)(
            input [n-1 : 0] A,B,
            input [2:0] op,
            input clk,en,rst,mov_sel,
            output reg [n-1 : 0] sum, 
            output reg o_flag,z_flag,n_flag
            );
    // reg [n-1 : 0 ] psum;
    // reg ro_flag,rz_flag,rn_flag;
        always @(rst,en,op) begin
        if(rst)begin
            sum = 'b0;
            o_flag = 0;
            z_flag = 0;
            n_flag = 0;
        end
        else if(en) begin
            case(op) 
                0:
                begin 
                    sum = A + B;
                    o_flag = (!A[n-1]&!B[n-1]&sum[n-1])|(A[n-1]&B[n-1]&!sum[n-1]);
                    z_flag =(|sum==0) ? 1:0;
                    n_flag =sum[n-1];
                end
                1:
                begin
                    sum = A - B;
                    o_flag = (!A[n-1]&B[n-1]&sum[n-1])|(A[n-1]&!B[n-1]&!sum[n-1]);
                    z_flag =(|sum==0) ? 1:0;
                    n_flag =sum[n-1];
                end
                2:
                begin
                    sum = A & B;
                    o_flag = 0;
                    z_flag =(|sum==0) ? 1:0;
                    n_flag =sum[n-1];
                end
                3:
                begin
                    sum = A | B;
                    o_flag = 0;
                    z_flag =(|sum==0) ? 1:0;
                    n_flag =sum[n-1];
                end
                4:
                begin
                    sum = A ^ B;
                    o_flag = 0;
                    z_flag =(|sum==0) ? 1:0;
                    n_flag =sum[n-1];
                end
                5:
                begin
                    sum = ~ A;
                    o_flag = 0;
                    z_flag =(|sum==0) ? 1:0;
                    n_flag =sum[n-1];
                end
                6:
                begin
                    sum =(mov_sel==0) ? A:B;
                    o_flag = 0;
                    z_flag =(|sum==0) ? 1:0;
                    n_flag =sum[n-1];
                end
                7:sum = A + 1;
                default: sum = 'bx; 
            endcase   
        end
    end


    // always @(posedge clk) begin
    //     if(rst)begin
    //         sum <= 'b0;
    //         o_flag <= 0;
    //         z_flag <= 0;
    //         n_flag <= 0;
    //     end
    //     else if(en) begin
    //         case(op) 
    //             0:
    //             begin 
    //                 sum <= A + B;
    //                 o_flag <= (!A[n-1]&!B[n-1]&sum[n-1])|(A[n-1]&B[n-1]&!sum[n-1]);
    //                 z_flag <=(|sum==0) ? 1:0;
    //                 n_flag <=sum[n-1];
    //             end
    //             1:
    //             begin
    //                 sum <= A - B;
    //                 o_flag <= (!A[n-1]&B[n-1]&sum[n-1])|(A[n-1]&!B[n-1]&!sum[n-1]);
    //                 z_flag <=(|sum==0) ? 1:0;
    //                 n_flag <=sum[n-1];
    //             end
    //             2:
    //             begin
    //                 sum <= A & B;
    //                 o_flag <= 0;
    //                 z_flag <=(|sum==0) ? 1:0;
    //                 n_flag <=sum[n-1];
    //             end
    //             3:
    //             begin
    //                 sum <= A | B;
    //                 o_flag <= 0;
    //                 z_flag <=(|sum==0) ? 1:0;
    //                 n_flag <=sum[n-1];
    //             end
    //             4:
    //             begin
    //                 sum <= A ^ B;
    //                 o_flag <= 0;
    //                 z_flag <=(|sum==0) ? 1:0;
    //                 n_flag <=sum[n-1];
    //             end
    //             5:
    //             begin
    //                 sum <= ~ A;
    //                 o_flag <= 0;
    //                 z_flag <=(|sum==0) ? 1:0;
    //                 n_flag <=sum[n-1];
    //             end
    //             6:
    //             begin
    //                 sum <=(mov_sel==0) ? A:B;
    //                 o_flag <= 0;
    //                 z_flag <=(|sum==0) ? 1:0;
    //                 n_flag <=sum[n-1];
    //             end
    //             7:sum <= A + 1;
    //             default: sum <= 'bx; 
    //         endcase   
    //     end
    // end


    // always @(psum,rst,en)begin
    //     if(rst == 1) begin
    //         sum = 'b0;
    //         o_flag = 0;
    //         z_flag = 0;
    //         n_flag = 0;
    //     end
    //     else if(en == 1) begin
    //         sum = psum;
    //         o_flag = ro_flag;
    //         z_flag = rz_flag;
    //         n_flag = rn_flag;
    //     end
    //     else begin
    //         sum = sum;
    //         o_flag = o_flag;
    //         z_flag = z_flag;
    //         n_flag = n_flag;
    //     end
    // end
    /*
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
    */
endmodule
    