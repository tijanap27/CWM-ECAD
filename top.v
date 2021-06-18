`timescale 1ns / 100ps

module Sys(
  input button,
  input clk,
  output green_c,
  output red_c,
  output yellow_c,
  output green_p,
  output red_p,
  output yellow_p
   );
  
  reg [1:0] state;
  
  assign green_c = (state == 2'b00);
  assign red_p = (state == 2'b00);
      
  assign yellow_c = (state == 2'b01);
  assign red_p = (state == 2'b01);
          
  assign red_c = (state == 2'b10);
  assign yellow_p = (state == 2'b10);
              
  assign red_c = (state == 2'b11);
  assign green_p = (state == 2'b11);
  
    
  always @(posedge clk) begin
    case (state)
      2'b00 : state <= #1 button == 0 ? 2'b00 : 2'b01;
      2'b01 : state <= #1 2'b10; 
      2'b10 : state <= #1 2'b11;
      2'b11 : state <= #1 2'b00;
      default: state <= #1 2'b00;
    endcase
  end
	       
endmodule
