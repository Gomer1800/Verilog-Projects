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
/*
module I_module(
    input clk,
    input error,
    output integral
    );
    // Create register to store integral value
    // Process
    
    parameter CE = 1'b1, delta_t = 1'b1;
    wire product, sum;
    reg previous_i;
    
    mult_gen_o multiplier(error, delta_t, product); // computer e(t)* delta_t = product
    c_addsub_o adder(product, previous_i, clk, CE, sum); // computes product + previous_i = sum
    dflops storeIntegral(clk, sum, previous_i); // assigns sum to previous_i dFlops
endmodule
*/

module simTemplate(
     );
    
      //reg  a, b;
      reg clk,h,s;
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
