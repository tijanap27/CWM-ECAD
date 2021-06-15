`timescale 1ns / 100ps

module doorbell(
    input a,
    input b, 
    input sel,
    output out
    );
    
    wire out;

    assign #5 out = (sel) ? b: a;
      
endmodule
