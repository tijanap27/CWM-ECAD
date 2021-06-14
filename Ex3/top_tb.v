//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name: Tijana Petrovic
// Date: 14.06.2021.
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
    parameter CLK_PERIOD = 10;

    reg clk;
    reg rst;
    reg change;
    reg on_off;
    reg err;
    wire [7:0] counter_out;
    reg [7:0] counter_out_prev;

    initial begin
    	clk = 1'b0;
    
        forever
            #(CLK_PERIOD/2) clk=~clk;
    end

    initial begin
	    err = 0;
	    change = 1;
	    rst = 1;
	    clk = 0;
	    on_off = 0;
	    #6
	    forever begin
            	#(CLK_PERIOD - 6) 
		if (counter_out != counter_out_prev)
		begin
			$display("***TEST FAILED! tick gap error");
			err = 1;
		end
		#6
            	if((on_off&&(counter_out==counter_out_prev))|(!on_off&&(counter_out!=counter_out_prev))) begin
		        $display("***TEST FAILED! enable error");
		        err = 1;
		end
            	if((change&&(counter_out!=counter_out_prev + 1))|(!change&&(counter_out!=counter_out_prev - 1))) begin
		        $display("***TEST FAILED! direction error");
		        err = 1; 
		end
		if(rst&&(counter_out!=0)) begin
		        $display("***TEST FAILED! rst error");
		        err = 1;
		end
		    
	    counter_out_prev = counter_out;
            if (on_off == 0)
            on_off = 1;
            if (counter_out==8'b00000011)
            	change = 0;
            if ((change == 0) & (counter_out == 8'b00000001))
		rst = 1;
	    if (counter_out == 0)
		rst = 0;
	    if (rst == 1)
		change = 1;
            end
	end
    
    initial begin
        #50 
        if (err == 0)
          $display("***TEST PASSED! :) ***");
        $finish;
    end

    monitor top(.rst (rst), 
                .on_off (on_off), 
                .change (change), 
                .clk (clk), 
                .counter_out (counter_out)
               );
 
endmodule 
