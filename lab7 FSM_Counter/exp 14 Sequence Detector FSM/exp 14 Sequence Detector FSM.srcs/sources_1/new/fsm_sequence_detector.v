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
module BC_DEC(    input CLK,
                  input Z,   
                  output [3:0] DISP_EN,
                  output [7:0] SEGMENTS);
                 
module seq_dvr (   input CLK,   
                   input [7:0] SWITCHES,
                   output [7:0] LEDS, 
                   output X);

module clk_div (  input clk,
                  output sclk);
                                                                 
*/

module fsm_sequence_detector(
    input clk,
    input BTN,
    input [5:0] sw,
    output [5:0] led,
    output [3:0] an,
    output [7:0] seg
    );
    
    wire sclk ;
    wire X ;
    parameter [2:0] A=3'b000, B=3'b001, C=3'b010, D=3'b011 ;
    parameter [2:0] E1=3'b100, E0=3'b101, F=3'b110 ;
    reg Z ;
    reg [2:0] Q , Qnext = A;
    
    // sseg_dec display ( CNT, 0 , 1, clk, an, seg ) ;
    clk_div newClock ( clk, sclk ) ;
    BC_DEC display ( clk, Z, an, seg ) ;
    seq_dvr sequenceGenerator ( sclk, sw, led, X ) ;
    
    always @ ( posedge sclk )
    begin
        Q <= Qnext ;
        
        case (Q)
                        A: begin
                            Z <= 1'b0 ;
                            if (X)
                                Qnext <= A ;
                            else Qnext <= B ;
                            end     
                        B: begin
                            Z <= 1'b0 ;
                            if (X)
                                Qnext <= C ;
                            else Qnext <= B ;
                            end
                        C: begin
                            Z <= 1'b0 ;
                            if (X)
                                Qnext <= D ;
                            else Qnext <= B ;
                            end
                        D: begin
                            Z <= 1'b0 ;
                            case (BTN)
                                1'b1: begin
                                    if (X)
                                        Qnext <= A ;
                                    else Qnext <= E0 ;
                                end
                                1'b0: begin
                                    if (X)
                                        Qnext <= E1 ;
                                    else Qnext <= B ;
                                end
                            endcase
                            end
                        E1: begin
                            Z <= 1'b0 ;
                            if (X)
                                Qnext <= A ;
                            else Qnext <= F ;
                            end
                        E0: begin
                            Z <= 1'b0 ;
                            if (X)
                                Qnext <= C ;
                            else Qnext <= B ;
                            end
                        F: begin
                            if (X) begin
                                Qnext <= C ;
                                Z <= 1'b1;
                                end
                            else begin 
                                Qnext <= B ;
                                Z <= 1'b0 ;
                                end
                            end
                        default: Q <= A ;
       endcase
    end   
endmodule