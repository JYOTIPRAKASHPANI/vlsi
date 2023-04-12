module NAND1(a,b,c);
  input a,b;
  output  c;
  wire x;
  //dataflow boolen function
  //assign c=~(a&b);//dataflow boolen function
  
  //gatelevel
  and(x,a,b);
  not(c,x);
  //behavioural
 /* output reg c;
    //case
  always @(a,b)
    begin
      case({a,b})
        2'b00:c<=1;
        2'b01:c<=1;
        2'b10:c<=1;
        2'b11:c<=0;
      endcase
      end*/
  
    //if else 
  /*always@(a,b)
    begin
      if (a==0 && b==0) c=1;
      else if (a==0 && b==1) c=1;
      else if (a==1 && b==0) c=1;
      else if (a==1 && b==1) c=0;
    end*/
  
  
  //structural
  //NAND1_struct g1(a,b,c);
  
endmodule

//structural
/*module NAND1_struct(x,y,z);
    input x,y;
    output z;
    and(p,x,y);
    not(z,p);
  endmodule*/