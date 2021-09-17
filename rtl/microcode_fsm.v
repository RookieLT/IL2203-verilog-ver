module microcode_fsm#(parameter M=3,
                      parameter N=8)
                  (input [15:0] din,
                    input o_flag,z_flag,n_flag,
                    input clk,rst,
                    output [M-1:0] waddr,
                    output [M-1:0] ra,rb,
                    output [2:0] op,
                    output [N-1:0] offset,
                    output rw,data_en,addr_en,ie,write,reada,readb,en,oe,bypassa,bypassb,mov_sel );
    reg [2:0] upc;
    wire ir;
    wire [1:0] flag_sel;
    reg [15:0] instruction;
    reg flag;
    wire [8:0] a;
    wire [17:0] b;
    //assign instruction='b0;
    always @(posedge clk) begin
        if(rst) begin
            upc <= 0;
            //instruction <= 'b0;
        end
        else begin
            if(upc==4)begin
                upc <= 0;
                //instruction <= din;
            end
            else begin
                upc <= upc + 1;
                //instruction <= instruction;
            end
        end
    end
    microcode_rom mcr(a,instruction[11:9],b,waddr);
    
    always @(posedge clk) begin
        if(rst)
            instruction <= 'b0;
        else begin
            if(ir)
                instruction <= din;
            else
                instruction <= instruction;
        end
    end
    
    always @(posedge clk) begin
        case(flag_sel)
            2'b00:flag=o_flag;
            2'b01:flag=z_flag;
            2'b10:flag=n_flag;
            default:flag=0;
        endcase
    end
    assign a={instruction[15:12],flag,upc};
    
    assign rw=b[17];
    assign data_en=b[16];
    assign addr_en=b[15];
    assign ie=b[14];
    assign write=b[13];
    assign reada=b[12];
    assign readb=b[11];
    assign en=b[10];
    assign oe=b[9];
    assign bypassa=b[8];
    assign bypassb=b[7];
    assign op=b[6:4];
    assign mov_sel=b[3];
    assign ir=b[2];
    assign flag_sel=b[1:0];
    assign ra=instruction[8:6];
    assign rb=instruction[5:3];

    assign offset=(&instruction[15:14]==1) ? {{4{instruction[11]}},instruction[11:0]}: {{7{instruction[8]}},instruction[8:0]};
    
endmodule