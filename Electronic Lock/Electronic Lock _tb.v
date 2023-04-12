module tb;
  reg clk,b0,b1,reset;
  wire unlock;
  integer i;
  reg [10:0]data;
  always #10 clk =~clk;
  detect_01011 g1(clk,reset,b0,b1,unlock);
  initial begin
    $monitor("i=%0d,Time=%0d,reset=%b,b0=%d,b1=%d,unlock=%b",i,$time,reset,b0,b1,unlock);
    
    $dumpfile("tb.vcd");
    $dumpvars(1,tb);
    clk =0;
    reset=1;
    #50    reset =0;
    
    data = 11'b11010111010;
    i=0;
    #240 $finish;
  end
  always @(posedge clk) begin
      b0=  ~(data[i]);
      b1= ~b0;
      i = i+1;
    end 
endmodule