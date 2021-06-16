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
    rst = 1;
	  button = 0;
	  sel = 0;
	  err = 0;
    
    #(CLK_PERIOD)
	  if (light!=24'hFFFFFF) begin
      $display("*** TEST FAILED :( ***");
		  err = 1;
	  end
    
  	sel = 1;
	  rst = 1;
    
    #(CLK_PERIOD)
	  if ((sel==1)&&(rst==1)&&(light!=24'b0)) begin
      $display("*** TEST FAILED :( ***");
		  err = 1;
	  end
  
    sel = 1;
	  rst = 0;
	  button = 1;
    #CLK_PERIOD
    prev_light = light;
    #CLK_PERIOD
    if(prev_light!=light) begin
      $display("*** TEST FAILED! :( ***");
	    err = 1;
	  end
    
    button = 1;
    #CLK_PERIOD
    forever begin
      prev_light=light;
      #CLK_PERIOD
      if(prev_light==light) begin
        $display("*** TEST FAILED! :( ***");
	      err = 1;
	    end
    end
 end
  
  
	initial begin
	  #500
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
