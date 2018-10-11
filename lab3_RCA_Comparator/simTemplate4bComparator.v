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
      reg [3:0] a; 
      reg [3:0] b;
      wire eq,lt,gt;
   
    //myComponent DUT (
    comparator DUT (
      .A(a),
      .B(b),
      .EQ(eq),
      .LT(lt),
      .GT(gt)
    );
   
    initial begin
      a = 3'b100;
      b = 3'b010;
      #20
      a = 3'b011;
      b = 3'b110;
      #20
      a = 3'b101;
      b = 3'b101;
      #20                                                                     
      $finish;
    end
endmodule
