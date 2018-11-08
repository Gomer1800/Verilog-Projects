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
      reg b,h,s;
      wire out;
   
    //myComponent DUT (
    sandwhich DUT (
      //.a(a),
      .B(b),
      //.b(b),
      .H(h),
      .S(s),
      //.out(out)
      .v(out)
    );
   
    initial begin
      b = 1'b0;
      h = 1'b0;
      s = 1'b0;
      #20
      b = 1'b0;
      h = 1'b1;
      s = 1'b0;
      #20
      b = 1'b1;
      h = 1'b0;
      s = 1'b1;
      #20
      b = 1'b1;
      h = 1'b1;
      s = 1'b0;
      #20
      $finish;
    end
endmodule
