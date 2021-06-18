`timescale 1ns / 100ps

module top_tb(
    );
    
  parameter CLK_PERIOD = 10;
  
  reg clk;
  reg button;
  reg err;
  wire green_c;
  wire red_c;
  wire yellow_c;
  wire green_p;
  wire red_p;
  wire yellow_p;

  initial begin
      clk = 1'b0;
      
      forever begin
        #(CLK_PERIOD/2) clk=~clk;
   end
  end
	
  initial begin 
    err = 0;
    
    forever begin
      button = 0;
      #CLK_PERIOD
      if(((green_c)&(yellow_c))|((green_c)&(red_c))|((yellow_c)&(red_c))) begin
        err = 1;
        $display("*** Test Failed :( ***);
      end
      if(((green_p)&(yellow_p))|((green_p)&(red_p))|((yellow_p)&(red_p))) begin
        err = 1;
        $display("*** Test Failed :( ***);
      end     
      if((green_c)&(green_p)) begin
        err = 1;
        $display("*** Test Failed :( ***);
      end
      
      button = 1;
      #CLK_PERIOD
      if(((green_c)&(yellow_c))|((green_c)&(red_c))|((yellow_c)&(red_c))) begin
        err = 1;
        $display("*** Test Failed :( ***);
      end
      if(((green_p)&(yellow_p))|((green_p)&(red_p))|((yellow_p)&(red_p))) begin
        err = 1;
        $display("*** Test Failed :( ***);
      end     
      if((green_c)&(green_p)) begin
        err = 1;
        $display("*** Test Failed :( ***);
      end
  end
  end
  
  initial begin
    #500
    if (err==0)
        $display("***TEST PASSED! :) ***");
       $finish;
  end
  
  Traffic top(
    .button(button),
    .clk(clk),
    .green_c(green_c),
    .red_c(red_c),
    .yellow_c(yellow_c),
    .green_p(green_p),
    .red_p(red_p),
    .yellow_p(yellow_p)
  );
  
endmodule
