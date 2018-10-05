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
      reg a,b,c,d;
      wire Nand,Nor;
   
    //myComponent DUT (
    Mystery DUT (
      //.a(a),
      .A(a),
      .B(b),
      //.b(b),
      .C(c),
      .D(d),
      .myNANDNAND(Nand),
      //.out(out)
      .myNORNOR(Nor)
    );
   
    initial begin
      a = 1'b0;
      b = 1'b0;
      c = 1'b0;
      d = 1'b0;
      #20
      a = 1'b0;
      b = 1'b0;
      c = 1'b0;
      d = 1'b1;
      #20
      a = 1'b0;
      b = 1'b0;
      c = 1'b1;
      d = 1'b0;
      #20
      a = 1'b0;
      b = 1'b0;
      c = 1'b1;
      d = 1'b1;
      #20
      a = 1'b0;
      b = 1'b1;
      c = 1'b0;
      d = 1'b0;
      #20
      a = 1'b0;
      b = 1'b1;
      c = 1'b0;
      d = 1'b1;
      #20
      a = 1'b0;
      b = 1'b1;
      c = 1'b1;
      d = 1'b0;
      #20
      a = 1'b0;
      b = 1'b1;
      c = 1'b1;
      d = 1'b1;
      #20
      a = 1'b1;
      b = 1'b0;
      c = 1'b0;
      d = 1'b0;
      #20
      a = 1'b1;
      b = 1'b0;
      c = 1'b0;
      d = 1'b1;
      #20
      a = 1'b1;
      b = 1'b0;
      c = 1'b1;
      d = 1'b0;
      #20
      a = 1'b1;
      b = 1'b0;
      c = 1'b1;
      d = 1'b1;
      #20
      a = 1'b1;
      b = 1'b1;
      c = 1'b0;
      d = 1'b0;
      #20
      a = 1'b1;
      b = 1'b1;
      c = 1'b0;
      d = 1'b1;
      #20
      a = 1'b1;
      b = 1'b1;
      c = 1'b1;
      d = 1'b0;
      #20
      a = 1'b1;
      b = 1'b1;
      c = 1'b1;
      d = 1'b1;
      #20                                          
      $finish;
    end
endmodule
