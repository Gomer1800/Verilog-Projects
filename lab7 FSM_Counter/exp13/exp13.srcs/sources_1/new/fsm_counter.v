`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2018 05:06:45 PM
// Design Name: 
// Module Name: 3B_FSM_counter
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
                 
module clk_div (  input clk,
                  output sclk);
                                                                 
*/

module fsm_counter(
    input clk,
    input CEN, reset,
    output [3:0] an,
    output [7:0] seg
    );
    
    wire sclk;
    parameter [2:0] ZERO=3'b000, TWO=3'b010, FOUR=3'b100, FIVE=3'b101, SEVEN=3'b111;
    reg [2:0] CNT = 3'b000;
    reg [2:0] CNTnext ;
    
    sseg_dec display( CNT, 0 , 1, clk, an, seg ) ;
    clk_div divider( clk, sclk ) ;
    
    wire LEDcounter;
    reg [25:0] refreshCounter;
    always @(posedge clk or posedge reset)
        begin 
         if(reset == 1)
          refreshCounter <= 0;
         else
          refreshCounter <= refreshCounter + 1;
        end 
        assign LEDcounter = refreshCounter[25:24];
        
    always @ ( posedge LEDcounter )
    begin
    case (CEN) // check Enable
        1'b1: begin // Enable active-low
            CNT <= CNTnext ;
        end
        1'b0: begin
            CNT <= CNT ;
        end
    endcase
    end
    
    always @ ( CNT )
    begin
        case (CNT)
                        ZERO: begin
                            CNTnext <= TWO;
                            end     
                        TWO: begin
                            CNTnext <= FOUR;
                            end
                        FOUR: begin
                            CNTnext <= FIVE;
                            end
                        FIVE: begin
                            CNTnext <= SEVEN;
                            end
                        SEVEN: begin
                            CNTnext <= ZERO;
                            end
                        default: CNTnext <= ZERO;
       endcase
    end
endmodule