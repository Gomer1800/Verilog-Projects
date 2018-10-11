`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2018 04:46:56 PM
// Design Name: 
// Module Name: RCA
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


module RCA(
        input [3:0] A,
        input [3:0] B,
        output Cout,
        output [3:0] S
    );
    
    wire [2:0] C;
    halfadder h1(A[0], B[0], S[0], C[0]);
    reducedFullAdder f1(A[1],B[1],C[0], S[1], C[1]);
    reducedFullAdder f2(A[2],B[2],C[1], S[2], C[2]);
    reducedFullAdder f3(A[3],B[3],C[2], S[3], Cout);
    
endmodule
