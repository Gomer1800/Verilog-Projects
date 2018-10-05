`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2018 05:15:29 PM
// Design Name: 
// Module Name: fulladder
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


module fulladder(
    input OP_A,
    input OP_B,
    input Cin,
    output SUM_SOP,
    output SUM_POS,
    output CO_SOP,
    output CO_POS
    );
    
    assign SUM_SOP = OP_A + OP_B + Cin ;
    assign SUM_POS = OP_A + OP_B + Cin ;
    
    assign CO_SOP = (~OP_A & OP_B & Cin) |
                    (OP_A & ~OP_B & Cin) |
                    (OP_A & OP_B & ~Cin) |
                    (OP_A & OP_B & Cin) ;
    assign CO_POS = (OP_A | OP_B | Cin) & 
                    (OP_A | OP_B | ~Cin) & 
                    (OP_A | ~OP_B | Cin) & 
                    (~OP_A | OP_B | Cin) ;
endmodule
