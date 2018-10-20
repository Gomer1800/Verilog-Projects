`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2018 05:23:13 PM
// Design Name: 
// Module Name: decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module exp6(
    //input dp, digit,
    input [3:0] SW,
    //output D, DG,
    output [6:0] C
    );
    
    begin
        assign C = 
        ((SW==0) ? 7'b1000000 :
        ((SW==1) ? 7'b1111001 :
        ((SW==2) ? 7'b0100100 :
        ((SW==3) ? 7'b0110000 :
        ((SW==4) ? 7'b0011001 :
        ((SW==5) ? 7'b0010010 :
        ((SW==6) ? 7'b0000010 :
        ((SW==7) ? 7'b1111000 :
        ((SW==8) ? 7'b0000000 :
        ((SW==9) ? 7'b0011000 : 7'b1111111
        )))))))))) ;
        end
endmodule

    /*reg DP, DIGIT;
    
    always @ (dp,digit)
    begin
        DP = (dp == 1) ? 1'b0 : 1'b1;
        DIGIT = (digit == 1) ? 1'b0 : 1'b1;
    end
    assign D = DP;
    assign DG = DIGIT;*/