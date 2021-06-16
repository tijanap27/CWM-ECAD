`timescale 1ns / 100ps

module doorbell(
    input [23:0] a,
    input [23:0] b, 
    input sel,
    output out
    );
    
    wire [23:0] out;

    assign #5 out = (sel) ? b: a;
      
endmodule
