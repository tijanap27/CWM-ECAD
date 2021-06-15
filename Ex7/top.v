//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name: Tijana Petrovic
// Date: 15.06.2021.
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////
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
