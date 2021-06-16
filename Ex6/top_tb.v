//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name: Tijana Petrovic
// Date: 15.06.2021.
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
	);

parameter CLK_PERIOD = 10;

reg clk;
reg enable;
reg [2:0] colour;
reg err;
wire [23:0] rgb;
reg [23:0] rgb_test;
  
initial begin
  clk = 1'b0;
  forever
      #(CLK_PERIOD/2) clk=~clk;
end
	
initial begin
    enable = 0;
    err = 0;
    colour = 3'b000;
	
    #(CLK_PERIOD)
    if (rgb!=24'b0) begin
	$display("***TEST FAILED :(***");
	err = 1;
    end

    forever begin
        enable = 1;
        rgb_prev = rgb;
        colour <= (colour + 3'd1);
        #(3*CLK_PERIOD)
        if (rgb_prev == rgb) begin
		$display("***TEST FAILED :(***);
	    	err = 1;
        end
    end
end
  
 initial begin
    #500
    if (err==0)
      $display("***TEST PASSED! :) ***");
      $finish;
 end
     
RGB_Converter top (.enable (enable),
	       .colour (colour),
	       .rgb (rgb),
	       .clk (clk)
	       );

endmodule 
