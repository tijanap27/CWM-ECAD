`timescale 1ns / 100ps

module Smart_Home(
    input clk,
    input rst,
    input button,
    input temperature_0,
    input temperature_1,
    input temperature_2,
    input temperature_3,
    input temperature_4,
    output heating,
    output cooling,
    output colour_0,
    output colour_1,
    output colour_2
    );
  
  
  AC my_AC(
    .clk(clk),
    .temperature({temperature_4,temperature_3,temperature_2,temperature_1,temperature_0}),
    .heating(heating),
    .cooling(cooling)
    );
  
  
  lights my_lights(
    .clk(clk),
    .rst(rst),
    .button(button),
    .colour({colour_2, colour_1, colour_0})
    );

endmodule
