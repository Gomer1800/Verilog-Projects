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
      wire [3:0] s;
      wire cout;
   
    //myComponent DUT (
    RCA DUT (
      //.a(a),
      .A(a),
      .B(b),
      //.b(b),
      .S(s),
      //.out(out)
      .Cout(cout)
    );

    // wire [2:0] C;
    /*
    halfadder h1(a[0], b[0], s[0], c[0]);
    reducedFullAdder f1(a[1],b[1],c[0], s[1], c[1]);
    reducedFullAdder f2(a[2],b[2],c[1], s[2], c[2]);
    reducedFullAdder f3(a[3],b[3],c[2], s[3], c);
   */
    initial begin
      a = 4'b0000;
      b = 4'b0001;
      #20
      a = 4'b0010;
      b = 4'b0010;
      #20
      a = 4'b0100;
      b = 4'b0100;
      #20
      a = 4'b1111;
      b = 4'b1111;
      #20
      a = 4'b1000;
      b = 4'b1000;
      #20                                                          
      $finish;
    end
endmodule
