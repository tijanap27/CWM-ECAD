`timescale 1ns / 100ps

module top_tb(
    );
    
    parameter CLK_PERIOD = 10;

    reg clk;
    reg rst;
    reg button;
    reg err;
    reg [4:0] temperature; 
    wire [2:0] colour;
    wire heating;
    wire cooling;
    reg [2:0] colour_prev;

    initial begin
       clk = 1'b0;
      
       forever
         #(CLK_PERIOD/2) clk=~clk;
    end
  

	
	
	
	
    initial begin
      #500
	    if (err==0) begin
        $display("***TEST PASSED! :) ***");
        $finish;
    end
    end
	    
  
  Smart_Home top(
    .clk(clk),
    .rst(rst),
    .button(button),
    .temperature(temperature),
    .heating(heating),
    .cooling(cooling),
    .colour(colour)
  );
  
