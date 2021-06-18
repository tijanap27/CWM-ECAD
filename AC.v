`timescale 1ns / 100ps

module AC(
    input clk,
    input [4:0] temperature,
    output heating,
    output cooling
    );
	
  wire idle; 
  reg [1:0] state;
  
  assign heating = (state == 2'b1); 
  assign cooling = (state == 2'b10);
  assign idle = (state == 2'b0);
  
  always @(posedge clk) begin
    case (state)
      2'b1 : state <= #1 temperature<5'd20 ? 2'b1 : 2'b0;
      2'b10 : state <= #1 temperature>5'd20 ? 2'b10 : 2'b0;
      2'b0 : state <= #1 temperature>=5'd22 ? 2'b10 : temperature<=5'd18 ? 2'b1 : 2'b0; 
      default : state <= #1 2'b0;
    endcase

  end
	       
endmodule
