`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2018 05:04:27 PM
// Design Name: 
// Module Name: exp9
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


module exp10(
    input clock_100Mhz,
    input reset,
    
    input [3:0] SWA, // A
    input [3:0] SWB, // B
    input BUTTON,    // button 0
    output RADIX,        // toggles radix
    output [3:0]DIGITS,  // toggles 4-digit display
    output [6:0] DISPLAY // toggles 7-seg display
    );
    
    wire EQ,LT,GT;
    wire button = BUTTON;
    wire LEDcounter;

    reg [19:0] refreshCounter;
    reg [6:0] display;
    wire [6:0] displayOutputA;
    wire [6:0] displayOutputB;
    reg radix;
    reg [3:0] digits; // MSB is the radix toggle, others toggle digit display
    
    comparator comp( SWA, SWB, EQ, LT, GT);    
    exp6 displayB( SWB, displayOutputB);
    exp6 displayA( SWA, displayOutputA);
    
always @(posedge clock_100Mhz or posedge reset)
    begin 
     if(reset == 1)
      refreshCounter <= 0;
     else
      refreshCounter <= refreshCounter + 1;
    end 
    assign LEDcounter = refreshCounter[19:18];
    
always @ (SWA, SWB, button, LEDcounter) begin
    case (LEDcounter)
    1'b0: begin // A cycle
        radix = 
        (reset & button) ? 1'b1 : 1'b0;
        digits = 
        ((reset == 0 & button == 0 & EQ == 1) ? 4'b1011 :
        ((reset == 0 & button == 0 & EQ == 0 & GT == 1) ? 4'b0111 :
        4'b1111));
        display =
        ((reset == 0 & button == 0 & EQ == 1) ? displayOutputA :
        ((reset == 0 & button == 0 & EQ == 0 & GT == 1) ? displayOutputA :
        7'b1111111));
        end
    1'b1: begin // B cycle
        radix = 
        (reset & button) ? 1'b1 : 1'b0;
        digits = 
        ((reset == 0 & button == 0 & EQ == 1) ? 4'b1101 :
        ((reset == 0 & button == 0 & EQ == 0 & LT == 1) ? 4'b1110 :
        4'b1111));
        display =
        ((reset == 0 & button == 0 & EQ == 1) ? displayOutputB :
        ((reset == 0 & button == 0 & EQ == 0 & LT == 1) ? displayOutputB :
        7'b1111111));    
        end
    default: begin
        radix = 1'b1;
        digits = 4'b1111;
        display = 7'b1111111;
        end
    endcase
    end
    
    assign RADIX = radix;
    assign DIGITS= digits;
    assign DISPLAY = display;
endmodule