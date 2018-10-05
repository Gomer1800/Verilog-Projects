`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2018 09:52:50 PM
// Design Name: 
// Module Name: Mystery
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


module Mystery(
    input A,
    input B,
    input C,
    input D,
    output myNANDNAND,
    output myNORNOR
    );
    
    assign myNANDNAND = ~(~(A&D)&~(A&C)&~(B&C)&~(B&D)) ;
    assign myNORNOR = ~(~(A | B) | ~(C | D)) ;
    
endmodule
