`timescale 1ns / 100ps

module Lights(
    input clk,
    input rst,
    input button,
    output reg [2:0] colour
    );

    always @(posedge clk) begin
		  if (rst)
			  colour <= 3'b000;
		  else begin
        if ((colour == 3'b000) | (colour == 3'b111))
            colour <= 3'b001;
        if (colour < 3'b110)
			    colour <= colour + button;
		    else
			    colour <= button ? 3'b001 : colour;
		    end
	   end

endmodule
