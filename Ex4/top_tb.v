//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name: Tijana Petrovic
// Date: 14.06.2021.
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module top_tb(
    );
    
    parameter CLK_PERIOD = 10;

	  reg clk;
    reg rst;
    reg button;
    reg err;
    wire [2:0] colour;
    reg [2:0] colour_prev;

    initial begin
       clk = 1'b0;
      
       forever
         #(CLK_PERIOD/2) clk=~clk;
    end

	initial begin
    clk = 0;
	  rst = 1;
    button = 1;
    err = 0;
	  #10
	  rst = 0;
    
    forever begin
	  #10
      if (rst&(colour!=0))
      begin
        $display("***TEST FAILED! Didn't reset! colour==%d, 	colour_prev==%d, rst='%d'***", colour, colour_prev, rst);
        err=1;
      end

      if ((colour == 0)|(colour == 3'b111)&(rst!=0))
        begin
          $display("***TEST FAILED! Out of bounds! colour==%d, colour_prev==%d, reset='%d' ***", colour, colour_prev, rst);
	        err = 1;
	      end

	    else begin
        if (colour_prev != 3'b110) begin
          if ((button&(colour!=colour_prev+1))| (!button&(colour!=colour_prev)))
          begin
            $display("***TEST FAILED! Button doesn't work! colour==%d, colour_prev==%d, button='%d' ***", colour, colour_prev, button);
	          err = 1;
		      end
        end
	    else begin
        if ((button&(colour!=3'b001))| (!button&(colour!=colour_prev)))
          begin
            $display("***TEST FAILED! Button doesn't work for 6! colour==%d, colour_prev==%d, button='%d' ***", colour, colour_prev, button);
	          err = 1;
		      end
        end
    end

	  colour_prev = colour;
	  button =! button;
end
end

  initial begin
    #300 
    if (err==0)
      $display("***TEST PASSED! :) ***");
     $finish;
  end

	LED top (
	        .clk (clk),
	        .rst (rst),
		.button (button),
          	.colour (colour)
	     );

endmodule 

