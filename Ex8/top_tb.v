//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8  - Simple End-to-End Design
// Student Name: Tijana Petrovic
// Date: 17.06.2021.
//
// Description: A testbench module to test Ex8
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module top_tb(
    );
    
parameter CLK_PERIOD = 10;

reg [4:0] temperature;
reg err;
wire heating;
wire cooling;

initial begin
    clk = 1'b0;
    forever
      #(CLK_PERIOD/2) clk=~clk;
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
	      if ((temperature>=5'b10110)&(heating != 1'b0)&(cooling != 1'b1)) begin
        	  err = 1;
		        $display("*** Test Failed :( *** wrong AC at temperature = %b", temperature);
    	  end 
	      if ((temperature>5'b10010)&(temperature<5'b10110)&(heating != 1'b0)&(cooling != 1'b0)) begin
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

top top (
   .temp (temp),
   .clk_p (clk_p),
   .clk_n (clk_n),
   .heating (heating),
   .cooling (cooling)
);
  
endmodule 
