//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name: Tijana Petrovic
// Date: 14.06.2021.
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
  parameter CLK_PERIOD = 10;
  
  reg clk;
  wire heating;
  wire cooling;
  reg err;
  reg [4:0] temperature; 

  initial begin
      clk = 1'b0;
      
      forever begin
        #(CLK_PERIOD/2) clk=~clk;
   end
  end
	
  initial begin
    err = 0;
    temperature = 5'b01111; // 15
    
    forever begin
    	#CLK_PERIOD
	if((temperature<=5'b10010)&(heating != 1'b1)&(cooling != 1'b0)) begin 
        	err = 1;
		$display("*** Test Failed :( *** wrong AC at temperature = %b", temperature);
    	end
	if ((temperature>=5'10110)&(heating != 1'b0)&(cooling != 1'b1)) begin
        	err = 1;
		$display("*** Test Failed :( *** wrong AC at temperature = %b", temperature);
    	end 
	if ((temperature>5'b10010)&(temperature<5'10110)&(heating != 1'b0)&(cooling != 1'b0)) begin
        	err = 1;
		$display("*** Test Failed :( *** wrong AC at temperature = %b", temperature);
    	end 
	    
    	temperature <= temperature + 5'b00001;
    	if (temperature>5'b11111)
		temperature<=5'b00000;
	    
    	end 
  end
  
  initial begin
    #500
    if (err==0)
        $display("***TEST PASSED! :) ***");
       $finish;
  end
  
  AC top(
    .clk(clk),
    .temperature(temperature),
    .heating(heating),
    .cooling(cooling)
  );
  
endmodule
