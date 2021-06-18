`timescale 1ns / 100ps

module Lights_Selector(
	input clk,
	input sel,
	input rst,
	input button,
	output [23:0] light
	);

	wire [2:0] colour;
	wire [23:0] rgb;

LED myled(.clk(clk),
	  .rst(rst),
	  .button(button),
          .colour(colour)
	  );

RGB_Converter myrgb(.clk(clk),
	            .colour(colour),
	            .enable(1'b1),
	            .rgb(rgb)
                  );

doorbell mydoorbell(.a(24'hFFFFFF),
	            .b(rgb),
	            .sel(sel),
	            .out(light)
	            );
endmodule
