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
    err = 0;
    temperature = 5'b01111; // 15
    clk = 0;
	  rst = 1;
	  #10
	  rst = 0;
    
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
	    
      button = 1;
		colour_prev = colour;
		#10
		if (rst&(colour!=0)) begin
        		$display("***TEST FAILED! Didn't reset! colour==%d, 	colour_prev==%d, rst='%d'***", colour, colour_prev, rst);
        		err=1;
      		end
		if (((colour == 0)|(colour == 3'b111))&(rst!=0)) begin
        		$display("***TEST FAILED! Out of bounds! colour==%d, colour_prev==%d, reset='%d' ***", colour, colour_prev, rst);
	        	err = 1;
		end
		else begin
        		if (colour_prev != 3'b110) begin
          			if ((button&(colour!=colour_prev+1))| (!button&(colour!=colour_prev))) begin
            				$display("***TEST FAILED! Button doesn't work! colour==%d, colour_prev==%d, button='%d' ***", colour, colour_prev, button);
	          			err = 1;
		     		end
        		end
			else begin
				if ((button&(colour!=3'b001))| (!button&(colour!=colour_prev))) begin
            				$display("***TEST FAILED! Button doesn't work for 6! colour==%d, colour_prev==%d, button='%d' ***", colour, colour_prev, button);
	          			err = 1;
		      		end
        		end
    		end
	  	
		button = 0;
		colour_prev = colour;
		#10
		if (rst&(colour!=0)) begin
        		$display("***TEST FAILED! Didn't reset! colour==%d, 	colour_prev==%d, rst='%d'***", colour, colour_prev, rst);
        		err=1;
      		end
		if (((colour == 0)|(colour == 3'b111))&(rst!=0)) begin
        		$display("***TEST FAILED! Out of bounds! colour==%d, colour_prev==%d, reset='%d' ***", colour, colour_prev, rst);
	        	err = 1;
		end
		else begin
        		if (colour_prev != 3'b110) begin
          			if ((button&(colour!=colour_prev+1))| (!button&(colour!=colour_prev))) begin
            				$display("***TEST FAILED! Button doesn't work! colour==%d, colour_prev==%d, button='%d' ***", colour, colour_prev, button);
	          			err = 1;
		     		end
        		end
		else begin
			if ((button&(colour!=3'b001))| (!button&(colour!=colour_prev))) begin
            				$display("***TEST FAILED! Button doesn't work for 6! colour==%d, colour_prev==%d, button='%d' ***", colour, colour_prev, button);
	          			err = 1;
		      	end
          	end      
      
  end
    end

    initial begin
      #500
      if (err==0)
        $display("***TEST PASSED! :) ***");
        $finish;
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
  
