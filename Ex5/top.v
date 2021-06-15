//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module AC(
    input clk,
    input [4:0] temperature,
    output reg heating,
    output reg cooling
    );

// 18 = 10010
// 20 = 10100
// 22 = 10110
	
     always @(posedge clk) begin
	     if ((heating==1)&(cooling==0)) begin
		if(temperature>=5'b10100) begin
          		heating <= 0;
			cooling <= 0;
		end
	     end
	     if ((heating==0)&(cooling==0)) begin
		if(temperature<=5'b10010) begin
          		heating <= 1;
			cooling <= 0;
		end
	     	if (temperature>=5'b10110) begin
          		cooling <= 1;
		     	heating <= 0;
	     	end
	     end
	     if((heating==0)&(cooling==1)) begin
		if (temperature<=5'b10100) begin
          		cooling <= 0;
			heating <= 0;
		end
	     end
     end               
            
endmodule

