module AND1(a,b,c);
  input a,b;
  output  c;
  //dataflow boolen function
  //assign c=a&b;//dataflow boolen function
  
  //gatelevel
  //and(c,a,b);
  
  //behavioural
  output reg c;
    //case
  always @(a,b)
    begin
      case({a,b})
        2'b00:c<=0;
        2'b01:c<=0;
        2'b10:c<=0;
        2'b11:c<=1;
      endcase
      end
  
    //if else 
  /*always@(a,b)
    begin
      if (a==0 && b==0) c=0;
      else if (a==0 && b==1) c=0;
      else if (a==1 && b==0) c=0;
      else if (a==1 && b==1) c=1;
    end*/
  
  
  //structural
  //AND1_struct g1(a,b,c);
  
endmodule

//structural
/*module AND1_struct(x,y,z);
    input x,y;
    output z;
    and(z,x,y);
  endmodule*/