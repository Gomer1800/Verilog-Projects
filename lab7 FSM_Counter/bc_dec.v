//----------------------------------------------------------------------------------
//-- Module Name:    BC_DEC
//-- Description: Special 7-segment display driver (4-letter words only)
//--
//--  One Input:  Z
//--
//--      Z = '1': COOL
//--      Z = '0': CrAP 
//-- J. Callenes
//--------------------------------------------------------------------------------


//-------------------------------------------------------------
//-- Two word seven-segment display driver. Outputs are active
//-- low and configured ABCEDFG in "segment" output. 
//--------------------------------------------------------------
module BC_DEC(    input CLK,
                  input Z,   
                  output [3:0] DISP_EN,
                  output [7:0] SEGMENTS);

   
//   -- intermediate signal declaration -----------------------
   reg  [1:0] cnt_dig; 
   reg [3:0]   digit;
   wire   sclk; 

   clk_div my_clk(.clk(CLK),
                  .sclk(sclk)); 

//   -- advance the count (used for display multiplexing) -----
  always@ (posedge sclk)
   begin
         cnt_dig <= cnt_dig + 1;
   end 

//   -- select the display sseg data abcdefg (active low) -----
   assign SEGMENTS = (digit==0)? 8'b01100011 :  //C
                     (digit==1)? 8'b00000011 :  //O
                     (digit==2)? 8'b00000011 :  //O
                     (digit==3)? 8'b11100011 :  //L
                     (digit==4)? 8'b01100011 :  //C
                     (digit==5)? 8'b11110101 :  //r
                     (digit==6)? 8'b00010001 :  //A
                     (digit==7)? 8'b00110001 :  //P
                        8'b11111111;

//   -- actuate the correct display --------------------------
   assign DISP_EN = (cnt_dig==0)? 4'b1110: 
                    (cnt_dig==1)? 4'b1101:
                    (cnt_dig==2)? 4'b1011: 
                    (cnt_dig==3)? 4'b0111: 4'b1111;
       
   always @ (cnt_dig,Z)
      begin
      if (Z) 
         case (cnt_dig)
            0:digit <= 4'b0000; //-- cool
            1:digit <= 4'b0001; 
            2:digit <= 4'b0010; 
            3:digit <= 4'b0011; 
            default: digit <= 4'b0000; 
         endcase
      else
         case (cnt_dig) 
            0: digit <= 4'b0100; //-- bad
            1: digit <= 4'b0101; 
            2: digit <= 4'b0110; 
            3: digit <= 4'b0111; 
            default: digit <= 4'b0000;
         endcase
  
   end
         
endmodule

//-----------------------------------------------------------------------
//-- Module to divide the clock 
//-----------------------------------------------------------------------
module clk_div (  input clk,
                  output sclk);

  integer MAX_COUNT = 2200; 
  integer div_cnt =0;
  reg tmp_clk=0; 

   always @ (posedge clk)              
   begin
         if (div_cnt == MAX_COUNT) 
         begin
            tmp_clk = ~tmp_clk; 
            div_cnt = 0;
         end else
            div_cnt = div_cnt + 1;  
   end 
   assign sclk = tmp_clk; 
endmodule
    
// endmodule
