`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2018 05:20:53 PM
// Design Name: 
// Module Name: exp11
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

/*
module sseg_dec( input [7:0] ALU_VAL, 
				 input SIGN,
				 input VALID,
                 input CLK,
                 output [3:0] DISP_EN,
                 output [7:0] SEGMENTS);
*/
                 
module exp11(
input CLOCK,
input [7:0] SWA,
input btnC, // Q
output [3:0] an,
output [7:0] seg
    );

reg [7:0] dFlopInput;

sseg_dec display( dFlopInput, 0, 1, CLOCK, an, seg );

always @ (posedge CLOCK)
begin
    if(btnC == 1'b1) // if button is pressed, SWA is latched to Flip Flop
        dFlopInput =  SWA;
end

endmodule
