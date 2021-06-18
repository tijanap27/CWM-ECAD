`timescale 1ns / 100ps

module Smart_Home(
    input clk,
    input rst,
    input button,
    input [4:0] temperature,
    output heating,
    output cooling,
    output [2:0] colour
    );
  
  
  AC my_AC(
    .clk(clk),
    .temperature(temperature),
    .heating(heating),
    .cooling(cooling)
    );
  
  
  lights my_lights(
    .clk(clk),
    .rst(rst),
    .button(button),
    .colour(colour)
    );

endmodule
