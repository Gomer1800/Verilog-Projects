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
    input [3:0] SWA, // A
    input [3:0] SWB, // B
    output D,        // radix
    output [3:0]DG, // digit toggle
    output [6:0] seg // 7-seg display
    );
    
    wire EQ,LT,GT;
    reg [3:0] RESULT;
    reg dgToggle ; 
    
    comparator comp( SWA, SWB, EQ, LT, GT);
    
    always @ (SWA, SWB) begin
        dgToggle = 
        (EQ == 1) ? 1'b0 : 1'b1;
        RESULT = 
        ((EQ == 1) ? 4'b0000 : 
        ((EQ == 0 && GT == 1) ? SWA :
        ((EQ == 0 && GT == 0) ? SWB : 4'b0000)
        ));        
    end
    
    exp6 display( RESULT, dgToggle, D, DG, seg);
    
/*module exp6(
    input [3:0] SW,
    output D, 
    output [2:0] DG,
    output [6:0] C
    );*/
        
/*module comparator(
        input [3:0] A,
        input [3:0] B,
        output EQ,
        output LT,
        output GT
        );*/
endmodule
