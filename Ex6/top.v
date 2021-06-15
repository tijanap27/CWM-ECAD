//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 - RGB Colour Converter
// Student Name: Tijana Petrovic
// Date: 15.06.2021.
//
//
//  Description: In this exercise, you need to design a memory with 8 entries, 
//  converting colours to their RGB code.
//
//  inputs:
//           clk, colour [2:0], enable
//
//  outputs:
//           rgb [23:0]
//
//////////////////////////////////////////////////////////////////////////////////

module RGB_Converter(
	input clk,
	input[2:0] colour,
	input enable,
	output [23:0] rgb
	);
  
block_memory_generator_6 your_instance_name (
  .clka(clk),    
  .ena(enable),      
  .wea(1'b0),      
  .addra(colour),  
  .dina(24'b0),    
  .douta(rgb)  
);
	
endmodule


