// Code your testbench here
// or browse Examples
module fsm_mealy_tb;
  wire y_out;
  wire [1:0]new_state;
  reg xin,clk,reset;
  
  fsm_mealy s1(xin,clk,reset,y_out,new_state);
  initial begin
    clk=0; forever #5 clk=~clk;
  end
  initial
    fork
      $dumpfile("fsm_mealy_tb.vcd");
      $dumpvars(1,fsm_mealy_tb);
      reset =0;
      #2 reset =1;
      #50 reset =0;
      #80 reset =1;
      #10 xin=1;
      #30 xin=0;
      #40 xin=1;
      #60 xin=0;
      #62 xin=1;
      #68xin=1;
      #75xin=1;
      
    join
  initial #100 $finish;
endmodule
  