`timescale 1ns / 100ps

module blinds(
    input [3:0] intensity,
    input button_blinders,
    output [1:0] out
    );
    
    wire [1:0] out;
  
    
    if (intensity>=4'd7) begin
        out = 2'b00;
    end
    else if ((intensity<=4'd7)&&(intensity>=4'd5) begin
        out = 2'b01;
    end
    else if ((intensity<4'd5)&&(intensity<=4'd3) begin
          out = 2'b10;
    end
    else if ((intensity<4'd3)||(button_blinders==1) begin
          out = 2'b11;
    end

endmodule
