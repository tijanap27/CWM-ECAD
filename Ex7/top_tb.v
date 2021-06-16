//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name: Tijana Petrovic
// Date: 16.06.2021.
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
	);
	
	parameter CLK_PERIOD = 10;

	reg clk;
	reg sel;
	reg rst;
	reg button;
	reg err;
	wire [23:0] light;
  	reg [23:0] prev_light;

	initial begin
	  clk = 1'b0;
	  forever
		  #(CLK_PERIOD/2) clk=~clk;
	end
  

initial begin
	err = 0;
	rst = 0;
	button = 0;
	
	prev_light = light;
	
	sel = 0;
	forever begin
		#(CLK_PERIOD*3)
	
		if (light!=24'hffffff) begin
			$display("***TEST FAILED :(***");
			err = 1;
		end

		button = 1;
		#(CLK_PERIOD*3)
		if (light!=24'hffffff) begin
			$display("***TEST FAILED :(***");
			err = 1;
		end

		sel = 1;
		rst = 1;
		#(CLK_PERIOD*3)
		if (light!=24'h0000FF) begin
			$display("***TEST FAILED :(***");
			err = 1;
		end
	
		rst = 0;
		button = 0;
		#(CLK_PERIOD*3)
		if (prev_light!=light) begin
			$display("***TEST FAILED :(***");
			err = 1;
		end

		prev_light = light;
	end
	
	button = 1;
	forever begin
		#(CLK_PERIOD*3)
		if(prev_light==light)begin
			$display("TEST FAILED");
			err = 1;
		end
	
		prev_light = light; 	
	end
end
	
	initial begin
	  #300
	  if (err==0) begin
		  $display("***TEST PASSED***");
		  $finish;
	  end
	end

	Lights_Selector top(
		.clk(clk),
		.sel(sel),
		.rst(rst),
		.button(button),
		.light(light)
	);

endmodule
