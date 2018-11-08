//----------------------------------------------------------------------------------
//-- Module Name:    SEQ_DVR
//-- Project Name: 
//-- Target Devices: 
//-- Tool versions: 
//-- Description: This model uses the switches as the input sequence. Each
//--  switch value is chosen one at a time and sent out. The corresponding 
//--  LED is actuated for a sanity check. 
//--  J. Callenes
//--------------------------------------------------------------------------------

//-------------------------------------------------------------
//-- Drive each of the switch inputs to the output one by one. 
//--------------------------------------------------------------
module seq_dvr (   input CLK,   
                   input [7:0] SWITCHES,
			       output [7:0] LEDS, 
                   output X);

//   -- intermediate signal declaration -----------------------
   reg [2:0] cnt_dig; 

//   -- advance the count (used for display multiplexing) -----
   always @ (posedge CLK)
   begin
         cnt_dig <= cnt_dig + 1; 
    end

   assign X = (cnt_dig==7)? SWITCHES[7]:
              (cnt_dig==6)? SWITCHES[6]:
              (cnt_dig==5)? SWITCHES[5]:
              (cnt_dig==4)? SWITCHES[4]:
              (cnt_dig==3)? SWITCHES[3]:
              (cnt_dig==2)? SWITCHES[2]:
              (cnt_dig==1)? SWITCHES[1]:
              (cnt_dig==0)? SWITCHES[0]:1'b0;
   
   assign LEDS = (cnt_dig==7)?8'h80:
                 (cnt_dig==6)?8'h40:
                 (cnt_dig==5)?8'h20:
                 (cnt_dig==4)?8'h10:
                 (cnt_dig==3)?8'h08:
                 (cnt_dig==2)?8'h04:
                 (cnt_dig==1)?8'h02:
                 (cnt_dig==0)?8'h01:8'h00;
    
      
endmodule


