`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 08:24:18 PM
// Design Name: 
// Module Name: exp6
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
    input [3:0] SW, // 4-bit switch input 
    output [6:0] C // 7-bit, display output
    );
    
    //reg DP = 1'b0;
    //reg [2:0] DIGIT = 3'b111;
    
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
