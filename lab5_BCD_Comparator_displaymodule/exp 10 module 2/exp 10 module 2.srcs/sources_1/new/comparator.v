`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2018 05:05:31 PM
// Design Name: 
// Module Name: comparator
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


module comparator(
    // two 4-bit inputs
    input [3:0] A, 
    input [3:0] B,
    // three 1-bit outputs
    output EQ,
    output LT,
    output GT
    );
    
    reg eq,lt,gt;
    
    always @ (A,B)
    begin
        if(A == B) begin // EQ = 1
            eq = 1'b1;
            lt = 1'b0;
            gt = 1'b0;
            end
        if(A < B) begin // LT = 1
            eq = 1'b0;
            lt = 1'b1;
            gt = 1'b0;
            end
        if(A > B) begin // GT = 1
            eq = 1'b0;
            lt = 1'b0;
            gt = 1'b1;
            end   
    end
    assign EQ = eq;
    assign LT = lt;
    assign GT = gt;
endmodule