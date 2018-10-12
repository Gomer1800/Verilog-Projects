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


module decoder(
    input [3:0] A,
    output [6:0] seg
    );
     
    begin
        assign seg = 
        ((A==0) ? 7'b1000000 :
        ((A==1) ? 7'b1111001 :
        ((A==2) ? 7'b0100100 :
        ((A==3) ? 7'b0110000 :
        ((A==4) ? 7'b0011001 :
        ((A==5) ? 7'b0010010 :
        ((A==6) ? 7'b0000010 :
        ((A==7) ? 7'b1111000 :
        ((A==8) ? 7'b0000000 :
        ((A==9) ? 7'b0011000 : 7'b1111111
        )))))))))) ;
        end
endmodule
