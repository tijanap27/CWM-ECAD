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

    always @(posedge clk) begin
      if ((heating==1)&(cooling==0))
        if(temperature>=5'b10100)
          heating = 0
      if ((heating==0)&(cooling==0)) 
        if(temperature<=5'b10010)
          heating = 1
        if (temperature>=5'b10110)
          cooling = 1
      if((heating==0)&(cooling==1))
        if (temperature<=5'b10100)  
          cooling = 0
     end

endmodule

