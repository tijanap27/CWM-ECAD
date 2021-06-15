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
	rst = 1;
	change = 0;
	on_off = 1;
	counter_out_prev = 0;
	
	#CLK_PERIOD
	forever begin
		counter_out_prev = counter_out;
		#CLK_PERIOD
		if(((counter_out!=0)&&(rst==1))||((counter_out!=counter_out_prev)&&(change==0)&&(rst==0))||((counter_out!=counter_out_prev+1)&&(change==1)&&(rst==0)&&(on_off==1))||((counter_out!=counter_out_prev-1)&&(change==1)&&(rst==0)&&(on_off==0))) begin
			$display("***TEST FAILED! :( *** %b", counter_out);
			err = 1;
		end

		rst = 0;
		counter_out_prev = counter_out;
		#CLK_PERIOD
		if(((counter_out!=0)&&(rst==1))||((counter_out!=counter_out_prev)&&(change==0)&&(rst==0))||((counter_out!=counter_out_prev+1)&&(change==1)&&(rst==0)&&(on_off==1))||((counter_out!=counter_out_prev-1)&&(change==1)&&(rst==1)&&(on_off==0))) begin
			$display("***TEST FAILED! :( ***");
			err = 1;
		end

		change = 1;
		counter_out_prev = counter_out;
		#CLK_PERIOD
		if(((counter_out!=0)&&(rst==1))||((counter_out!=counter_out_prev)&&(change==0)&&(rst==0))||((counter_out!=counter_out_prev+1)&&(change==1)&&(rst==0)&&(on_off==1))||((counter_out!=counter_out_prev-1)&&(change==1)&&(rst==0)&&(on_off==0))) begin
			$display("***TEST FAILED! :( ***");
			err = 1;
			end

		on_off = 0;
		counter_out_prev = counter_out;
		#CLK_PERIOD
		if(((counter_out!=0)&&(rst==1))||((counter_out!=counter_out_prev)&&(change==0)&&(rst==0))||((counter_out!=counter_out_prev+1)&&(change==1)&&(rst==0)&&(on_off==1))||((counter_out!=counter_out_prev-1)&&(change==1)&&(rst==0)&&(on_off==0))) begin
			$display("***TEST FAILED! :( ***");
			err = 1;
		end

	end
	end
    
    initial begin
        #500
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
