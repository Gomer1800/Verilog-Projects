`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2018 05:11:01 PM
// Design Name: 
// Module Name: bcd7segment
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


module bcd7segment(
    input [2:0] BTN,
    input [3:0] SW,
    output [3:0] digit,
    output [6:0] seg
    );
    
    reg [3:0] DIGIT;
    reg [6:0] SEG;
    
    always @ (BTN,SW) begin
        // Logic for Push Buttons
        DIGIT[0] = ((~BTN[2]) + (~BTN[1] & ~BTN[0])) ;
        DIGIT[1] = ((~BTN[2]) + (BTN[1] & ~BTN[0])) ;
        DIGIT[2] = ((~BTN[2]) + (~BTN[1] & BTN[0])) ;
        DIGIT[3] = ((~BTN[2]) + (BTN[1] & BTN[0])) ;
        
        SEG = 
                // One Cold Code
                ((~BTN[2] && SW==0) ? 7'b1000000 : // 0111111 X
                ((~BTN[2] && SW==1) ? 7'b1111001 : // 0000110 X
                ((~BTN[2] && SW==2) ? 7'b0100100 : // 1011011 X
                ((~BTN[2] && SW==3) ? 7'b0110000 : // 1001111 X
                ((~BTN[2] && SW==4) ? 7'b0011001 : // 1100110 X
                ((~BTN[2] && SW==5) ? 7'b0010010 : // 1101101 X
                ((~BTN[2] && SW==6) ? 7'b0000010 : // 1111101 X
                ((~BTN[2] && SW==7) ? 7'b1111000 : // 0000111 X 
                ((~BTN[2] && SW==8) ? 7'b0000000 : // 1111111 X
                ((~BTN[2] && SW==9) ? 7'b0011000 : // 1100111 X
                ((~BTN[2] && SW==10) ? 7'b0001000 : // 1110111 X
                ((~BTN[2] && SW==11) ? 7'b0000011 : // 1111000 X
                ((~BTN[2] && SW==12) ? 7'b1000110 : // 0111001 X
                ((~BTN[2] && SW==13) ? 7'b0100001 : // 1011110 X 
                ((~BTN[2] && SW==14) ? 7'b0000110 : // 1111001
                ((~BTN[2] && SW==15) ? 7'b0001110 : 7'b1111111) // 1110001 0000000
                ))))))))))))))) ;
     end
     assign digit = DIGIT;
     assign seg = SEG;
     endmodule                   
        // Logic for switches
        /*SEG[0] = ~(~SW[3] & ~SW[2] & ~SW[1] & ~SW[0]);
        SEG[1] = ~(~SW[3] & ~SW[2] & ~SW[1] & ~SW[0]);
        SEG[2] = ~(~SW[3] & ~SW[2] & ~SW[1] & ~SW[0]);
        SEG[3] = ~(~SW[3] & ~SW[2] & ~SW[1] & ~SW[0]);
        SEG[4] = ~(~SW[3] & ~SW[2] & ~SW[1] & ~SW[0]);
        SEG[5] = ~(~SW[3] & ~SW[2] & ~SW[1] & ~SW[0]);*/

         
        /*SEG[6] = ~((SW[3] & SW[2] & SW[1]) + (~SW[3] & ~SW[2] & SW[1] & SW[0]) + 
            (SW[3] & ~SW[2] & ~SW[1] & ~SW[0]));
            
        SEG[5] = ~((SW[3] & SW[2] & ~SW[0]) + (SW[3] & SW[2] & ~SW[1]) + 
            (SW[3] & ~SW[1] & ~SW[0]) + (~SW[3] & ~SW[2] & SW[1] & ~SW[0]));
            
        SEG[4] = ~((SW[3] & ~SW[0]) + (SW[3] & SW[2] & ~SW[1]) + 
            (SW[3] & ~SW[1] & ~SW[0]) + (~SW[3] & ~SW[2] & SW[1] & ~SW[0]));
            
        SEG[3] = ~((SW[3] & ~SW[2] & SW[1] & SW[0]) + (SW[2] & SW[1] & ~SW[0]) +
            (~SW[2] & ~SW[1] & ~SW[0]) + (~SW[3] & SW[2] & ~SW[1] & SW[0]));
            
        SEG[2] = ~((~SW[3] & ~SW[2] & SW[1] & SW[0]) + (~SW[3] & ~SW[2] & ~SW[1]) +
            (~SW[3] & ~SW[1] & ~SW[0]) + (SW[3] & SW[2] & ~SW[1] & SW[0]));
            
        SEG[1] = ~((~SW[3] & ~SW[2] & SW[0]) + (~SW[3] & ~SW[2] & ~SW[1]) + 
            (SW[3] & ~SW[2] & SW[1] & ~SW[0]) + (~SW[3] & ~SW[1] & ~SW[0]) +
                (~SW[2] & ~SW[1] & SW[0]));
                
        SEG[0] = ~((SW[3] & ~SW[2] & SW[1] & SW[0]) + (SW[3] & SW[2] & SW[1] & ~SW[0]) +
            (~SW[3] & ~SW[2] & SW[1] & ~SW[0]) + (~SW[3] & SW[2] & ~SW[1] & ~SW[0]));*/
    
    //assign DIGIT = digitl;
    //assign SEG = seg;
    
    /*reg [6:0] SEG;
    reg [3:0] DIGIT;
    
    always @ (BTN, SW) begin
        begin
        assign DIGIT = 
        // one cold code !!!!
        ((BTN[1]==0 && BTN[0]==0) ? 4'b0001 : // 1110
        ((BTN[1]==1 && BTN[0]==0) ? 4'b0010 : // 1101
        ((BTN[1]==0 && BTN[0]==1) ? 4'b0100 : // 1011
        ((BTN[1]==1 && BTN[0]==1) ? 4'b1000 : // 0111
        ((BTN[2]==1) ? 4'b1111 : 4'b0000) // 0000 : 1111
        ))));
        end
        assign DIGIT = digit;
        
    begin
        assign SEG = 
        // One Cold Code
        ((SW==0) ? 7'b1000000 : // 0111111 X
        ((SW==1) ? 7'b1111001 : // 0000110 X
        ((SW==2) ? 7'b0100100 : // 1011011 X
        ((SW==3) ? 7'b0110000 : // 1001111 X
        ((SW==4) ? 7'b0011001 : // 1100110 X
        ((SW==5) ? 7'b0010010 : // 1101101 X
        ((SW==6) ? 7'b0000010 : // 1111101 X
        ((SW==7) ? 7'b1111000 : // 0000111 X 
        ((SW==8) ? 7'b0000000 : // 1111111 X
        ((SW==9) ? 7'b0011000 : // 1100111 X
        ((SW==10) ? 7'b0001000 : // 1110111 X
        ((SW==11) ? 7'b0000111 : // 1111000 X
        ((SW==12) ? 7'b1000110 : // 0111001 X
        ((SW==13) ? 7'b0100001 : // 1011110 X 
        ((SW==14) ? 7'b0000110 : // 1111001
        ((SW==15) ? 7'b0001110 : 7'b1111111) // 1110001 0000000
        ))))))))))))))) ;
        end
        assign SEG = seg;
    end*/
