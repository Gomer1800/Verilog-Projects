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
        input [0:3] A,
        input [0:3] B,
        output Cout,
        output [0:3] S
    );
    wire C0,C1,C2;
    halfadder h1(A[0], B[0], S[0], C0);
    reducedFullAdder f1(A[1],B[1],C0, S[1], C1);
    reducedFullAdder f2(A[2],B[2],C1, S[2], C2);
    reducedFullAdder f3(A[3],B[3],C2, S[3], Cout);
    
endmodule
