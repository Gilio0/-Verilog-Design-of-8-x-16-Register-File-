module Reg_File 
(
    input  wire          WrEn, RdEn,
    input  wire          CLK, RST,
    input  wire  [7:0]   Address,
    input  wire  [15:0]  WrData, 
    output reg   [15:0]  RdData
);

    // 2D Array
    reg [15:0] Reg_File [7:0];        

     always @(posedge CLK or negedge RST)
        begin
            if(!RST) begin
                Reg_File[0] <= 16'b0 ;
                Reg_File[1] <= 16'b0 ;
                Reg_File[2] <= 16'b0 ;
                Reg_File[3] <= 16'b0 ;
                Reg_File[4] <= 16'b0 ;
                Reg_File[5] <= 16'b0 ;
                Reg_File[6] <= 16'b0 ;
                Reg_File[7] <= 16'b0 ;
                RdData <= 0;
            end
            else begin
                if (WrEn && !RdEn) begin
                    Reg_File[Address] <= WrData;
                end
                else if (RdEn && !WrEn) begin
                    RdData <= Reg_File[Address];
                end
            end
        end

endmodule