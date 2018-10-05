`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2018 05:46:13 PM
// Design Name: 
// Module Name: reducedFullAdder
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


module reducedFullAdder(
    input A,
    input B,
    input C,
    output SUM,
    output CO
    );
    
    // POS assign SUM = (~B) & (A^C) | B & (~(A^C)) ;
    // assign SUM = (A & (~(B^C))) | ((~A) & (B^C)) ;
    assign SUM = A^B^C ;
    assign CO = (B&C) | (A&C) | (A&B) ;
endmodule
