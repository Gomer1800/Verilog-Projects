`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2018 08:37:20 AM
// Design Name: 
// Module Name: simTemplate
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


module simTemplate(
     );
    
      //reg  a, b;
      reg a,b,c;
      wire sumSOP,sumPOS,coSOP,coPOS;
   
    //myComponent DUT (
    fulladder DUT (
      //.a(a),
      .OP_A(a),
      //.b(b),
      .OP_B(b),
      .Cin(c),
      //.out(out)
      .SUM_SOP(sumSOP),
      .SUM_POS(sumPOS),
      .CO_SOP(coSOP),
      .CO_POS(coPOS)
    );
   
    initial begin
      a = 1'b0;
      b = 1'b0;
      c = 1'b0;
      #20
      a = 1'b0;
      b = 1'b0;
      c = 1'b1;
      #20
      a = 1'b0;
      b = 1'b1;
      c = 1'b0;
      #20
      a = 1'b1;
      b = 1'b0;
      c = 1'b0;
      #20
      a = 1'b0;
      b = 1'b1;
      c = 1'b1;
      #20
      a = 1'b1;
      b = 1'b0;
      c = 1'b1;
      #20
      a = 1'b1;
      b = 1'b1;
      c = 1'b0;
      #20
      a = 1'b1;
      b = 1'b1;
      c = 1'b1;
      #20
      $finish;
    end
endmodule
