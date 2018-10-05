`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Luis Gomez, Rocio Sanchez
// 
// Create Date: 09/24/2018 11:21:21 PM
// Design Name: 
// Module Name: halfadder
// Project Name: Lab0
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


module halfadder(
    input OP_A,
    input OP_B,
    output SUM,
    output CO
    );
    
    assign SUM = OP_A^OP_B ;
    assign CO = OP_A & OP_B ;
endmodule