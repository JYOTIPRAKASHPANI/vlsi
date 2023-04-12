module vending_machine_tb;
  wire y_out;
  wire [3:0]new_state;
  reg [3:0]xin;
  reg clk,reset;
  
  vending_machine s1(xin,clk,reset,y_out,new_state);
  initial begin
    clk=0; forever #5 clk=~clk;
  end
  initial
    begin
      $dumpfile("vending_machine_tb.vcd");
      $dumpvars(1,vending_machine_tb);
      
      $monitor("time=%d ,Entered coin is =%d",$time,xin);
      reset =0;
      #2 reset =1;
      #4 xin=4'b0101;
      #10 xin=4'b1010;
      #19 reset =0;
      #10 xin=4'b0000;
      #10 xin=4'b1010;
      #10 xin=4'b0101;
      #10 reset =1;
      #10 xin=4'b1010;
      #10 xin=4'b1010;
      
    end
  initial #100 $finish;
endmodule