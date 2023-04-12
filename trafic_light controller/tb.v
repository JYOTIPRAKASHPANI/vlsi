// Code your testbench here
// or browse Examples
module trafic_light_tb;
  wire [2:0]eout;
  wire forMR,forMY,forMG,forSR,forSY,forSG;
  reg clk,Dreset,Dss;
  always #5 clk=~clk;
  
  trafic_light g1(clk,Dreset,forMR,forMY,forMG,forSR,forSY,forSG,Dss,eout);
  initial begin
    $monitor("time=%d,ss=%d,forMR=%d,forMY=%d,forMG=%d,forSR=%d,forSY=%d,forSG=%d,out=%b",$time,forMR,forMY,forMG,forSR,forSY,forSG,Dss,eout);
    
    $dumpfile("trafic_light_tb.vcd");
    $dumpvars(1,trafic_light_tb);
    clk=0;
    Dreset=1;
    #50 Dreset =0;
    
    Dss=1'b0;
    #20 Dss=1'b1;
    #100  Dss=1'b0;
    #50 Dss=1'b1;
    #80  Dss=1'b0;
    #20 $finish;
  end
endmodule