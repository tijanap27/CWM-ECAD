`timescale 1ns / 100ps

module Blinds(
    input intensity,
    output [1:0] out
    );
    
    wire [1:0] out;
  
    if (intensity>=7) begin
      out = 2'b00;
    end
    else if ((intensity<=7)&&(intensity>=5) begin
        out = 2'b01;
    end
    else if ((intensity<5)&&(intensity<=3) begin
          out = 2'b10;
    end
    else if ((intensity<3)) begin
          out = 2'b11;
    end

endmodule
