`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2018 04:40:54 PM
// Design Name: 
// Module Name: TFlop_4BCounter
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
    module sseg_dec( input [7:0] ALU_VAL, 
                     input SIGN,
                     input VALID,
                     input CLK,
                     output [3:0] DISP_EN,
                     output [7:0] SEGMENTS);
    */
               
 module TFlop_4BCounter(
        input [3:0] SWA,
       input CLOCK,
       input btnEn, btnT, // En & T inputs (left & right)
       output [3:0] an,
       output [7:0] seg
           );
       
       wire bit;
       
       reg [4:0] TFlopInput;
       reg [4:0] Q ;
       reg Qnext;
       
       sseg_dec display( TFlopInput, 0, 1, CLOCK, an, seg );           
   
       always @ (posedge CLOCK)
       begin
               
           Qnext <= btnT & btnEn; // inverted button states
               
           if( Qnext == 1'b1 ) begin
               TFlopInput <= ~SWA;
               end
               
           else begin 
            TFlopInput <= SWA;
           end
       end
   endmodule          
                     
 /*module TFlop_4BCounter(
    input CLOCK,
    input btnEn, btnT, // En & T inputs (left & right)
    output [3:0] an,
    output [7:0] seg
        );
    
    reg [3:0] counter;
    reg [19:0] refreshTimer;
    wire bit;
    
    reg [4:0] TFlopInput;
    reg Q = 1'b0;
    reg Qnext;
    
    sseg_dec display( TFlopInput, 0, 1, CLOCK, an, seg );
        
    assign bit = refreshTimer[19:18];

    always @ (posedge CLOCK)
    begin
            
        Qnext <= btnT & btnEn; // inverted button states
        Q <= Qnext;
            
        if( Qnext == 1'b1 ) begin
            TFlopInput <= counter;
            refreshTimer <= refreshTimer + 1;
            if (bit == 1'b1)
                counter <= counter + bit;
        end
        else TFlopInput <= ~counter;     
    end
endmodule*/
