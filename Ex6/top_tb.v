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
reg [23:0] test;
  
initial begin
  clk = 1'b0;
  forever
      #(CLK_PERIOD/2) clk=~clk;
end

initial begin
	#(CLK_PERIOD)
	err = 0;
	enable = 0;
	colour = 3'b000;
	
	if (rgb != 24'b0) begin
		$display("***TEST FAILED :( ***");
		err = 1;
	end

	forever begin
		enable = 1;

		#(CLK_PERIOD)
		colour = 3'b000;
		if (rgb!=24'b0) begin
			$display("***TEST FAILED :( ***");
			err = 1;
		end
		
		#(CLK_PERIOD)
		colour = 3'b001;
		if (rgb!=24'b000000000000000011111111) begin
			$display("***TEST FAILED :( ***");
			err = 1;
		end

		#(CLK_PERIOD)
		colour = 3'b010;
		if (rgb!=24'b000000001111111100000000) begin
			$display("***TEST FAILED :( ***");
			err = 1;
		end

		#(CLK_PERIOD)
		colour = 3'b011;
		if (rgb!=24'b000000001111111111111111) begin
			$display("***TEST FAILED :( ***");
			err = 1;
		end

		#(CLK_PERIOD)
		colour = 3'b100;
		if (rgb!=24'b111111110000000000000000) begin
			$display("***TEST FAILED :( ***");
			err = 1;
		end

		#(CLK_PERIOD)
		colour = 3'b101;
		if (rgb!=24'b111111110000000011111111) begin
			$display("***TEST FAILED :( ***");
			err = 1;
		end

		#(CLK_PERIOD)
		colour = 3'b110;
		if (rgb!=24'111111111111111100000000) begin
			$display("***TEST FAILED :( ***");
			err = 1;
		end

		#(CLK_PERIOD)
		colour = 3'b111;
		if (rgb!=24'111111111111111111111111) begin
			$display("***TEST FAILED :( ***");
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
     
RGB top (.enable (enable),
	       .colour (colour),
	       .rgb (rgb),
	       .clk (clk)
	       );

endmodule 
