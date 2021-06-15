//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name: Tijana Petrovic
// Date: 15.06.2021.
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
	if(((5'b10010<temperature<5'b10110)&&(cooling==0)&&(temperature==0))||((temperature>=5'b10100)&&(heating==1))||((temperature<=5'b10100)&&(cooling==1))) begin
		cooling = 0;
		heating = 0;
	end
	else if(((temperature>=5'b10110)&&(cooling==0)&&(heating==0))||((temperature>=5'b10110)&&(cooling==0)&&(heating==1))||((temperature>=5'b10110)&&(cooling==1)&&(heating==0))||((temperature>=5'b10110)&&(cooling==1)&&(heating==1))||((temperature>5'b10100)&&(cooling==1))) begin
		cooling = 1;
		heating = 0;
	end
	else if(((temperature<=5'b10010)&&(cooling==0)&&(heating==0))||((temperature<=5'b10010)&&(cooling==0)&&(heating==1))||((temperature<=5'b10010)&&(cooling==1)&&(heating==0))||((temperature<=5'b10010)&&(cooling==1)&&(heating==1))||((temperature<5'b10100)&&(heating==1))) begin
		cooling = 0;
		heating = 1;
	end
     end      
	       
endmodule

