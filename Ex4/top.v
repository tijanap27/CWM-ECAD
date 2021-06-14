//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name: Tijana Petrovic
// Date: 14.06.2021.
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
    

`timescale 1ns / 100ps

module LED(
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

