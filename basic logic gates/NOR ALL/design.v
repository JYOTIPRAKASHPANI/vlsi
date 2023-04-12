// Code your design here
module nor1(a,b,c);
  input a,b;
  output c;
  wire x;
  //assign c=~(a|b);
  
  //or(x,a,b);
  //not(c,x);
  
  /*output reg c;
  always @(a,b)
    
    begin
      /*case({a,b})
        2'b00:c<=1;
        2'b01:c<=0;
        2'b10:c<=0;
        2'b11:c<=0;
      endcase//
      
      
      if(a==0 && b==0) c=1;
      else if(a==0 && b==1) c=0;
      else if(a==1 && b==0) c=0;
      else if(a==1 && b==1) c=0;
    end */
  
  nor_struct g1(a,b,c);
endmodule

module nor_struct(x,y,z);
  input x,y;
  output z;
  wire p;
  or(p,x,y);
  not(z,p);
endmodule