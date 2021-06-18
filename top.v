`timescale 1ns / 100ps

module Smart_Home(
    input clk,
    input rst,
    input button,
    input intensity,
    input button_blinders,
    input [4:0] temperature,
    output heating,
    output cooling,
    output [1:0] out,
    output reg [2:0] colour
    );
  
  
  AC my_AC(
    .clk(clk),
    .temperature(temperature),
    .heating(heating),
    .cooling(cooling)
    );
  
  
  blinds my_blings(
    .intensity(intensity),
    .button_blinders(button_blinders),
    output [1:0] out
    );
  
  
  lights my_lights(
    .clk(clk),
    .rst(rst),
    .button(button),
    .colour(colour)
    );
