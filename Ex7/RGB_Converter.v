`timescale 1ns / 100ps

module RGB_Converter(
	input clk,
	input[2:0] colour,
	input enable,
	output [23:0] rgb
	);
  
block_memory_generator your_instance_name (
  .clka(clk),    
  .ena(enable),      
  .wea(1'b0),      
  .addra(colour),  
  .dina(24'b0),    
  .douta(rgb)  
);
	
endmodule
