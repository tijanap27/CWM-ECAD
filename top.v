`timescale 1ns / 100ps

module Traffic(
  input button,
  input clk,
  output green_c,
  output red_c,
  output yellow_c,
  output green_p,
  output red_p,
  output yellow_p
   );
  
  reg [2:0] state;
  
  assign green_c = (state == 3'b000);
  assign red_p = (state == 3'b000);
      
  assign yellow_c = (state == 3'b001);
  assign red_p = (state == 3'b001);
          
  assign red_c = (state == 3'b010);
  assign yellow_p = (state == 3'b010);
              
  assign red_c = (state == 3'b011);
  assign green_p = (state == 3'b011);
	
  assign red_c = (state == 3'b110);
  assign yellow_p = (state == 3'b110);
	
  assign yellow_c = (state == 3'b101);
  assign red_p = (state == 3'b101);
  
    
  always @(posedge clk) begin
    case (state)
      3'b000 : state <= #1 button == 0 ? 3'b000 : 2'b001;
      3'b001 : state <= #1 3'b010; 
      3'b010 : state <= #1 3'b011;
      3'b011 : state <= #1 3'b110;
      3'b110 : state <= #1 3'b101;
      3'b101 : state <= #1 3'b000;
      default: state <= #1 3'b000;
    endcase
  end
	       
endmodule
