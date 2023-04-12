// Code your testbench here
// or browse Examples
module nor1_tb;
  wire c;
  reg a,b;
  integer i;
  nor1 g1(a,b,c);
  initial begin
    $dumpfile("nor1_tb.vcd");
    $dumpvars(1,nor1_tb);
    $monitor("a=%d,b=%d,c=%d",a,b,c);
    
    /*a=1'b0; b=1'b0;
    #5
    a=1'b0; b=1'b1;
    #5
    a=1'b1; b=1'b0;
    #5
    a=1'b1; b=1'b1;
    #5;*/
    
    /*for(i=0;i<4;i++)
      begin
        {a,b}=i;
        #5;
      end*/
    {a,b}=0;
    i=0;
    while(i<4)
      begin
        {a,b}=i;
        i=i+1;
        #5;
      end
    
  end
endmodule