// Code your testbench here
// or browse Examples
module AND1_tb;
  wire c;
  reg a,b;
  integer i;
  
  AND1 g1(a,b,c);
  initial begin
    $dumpfile("AND1_tb.vcd");
    $dumpvars(1,AND1_tb);
    $monitor("a=%d,b=%d,c=%d",a,b,c);
    //using delay
    /*a=1'b0;  b=1'b0;
    #5
    a=1'b0;  b=1'b1;
    #5
    a=1'b1;  b=1'b0;
    #5
    a=1'b1;  b=1'b1;
    #5;*/
    
    //using for lop
    {a,b}=0;
    for(i=0;i<4;i=i+1)
      begin
        #5
        {a,b}=i;
      end
    
    //while loop
    /*i=0;
    {a,b}=0;
    while(i<4)
      begin
        {a,b}=i;
        i=i+1;
        #5;
      end*/
    end
endmodule