`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2018 10:03:00 PM
// Design Name: 
// Module Name: sandwhich
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


module sandwhich(
    input B,
    input H,
    input S,
    output v
    );
    
    assign v = (~B & ~H & S) |
               (B & ~H & ~S) |
               (~B & H & ~S) ;
endmodule
