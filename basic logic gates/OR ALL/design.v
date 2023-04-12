// Code your design here
module or1(a,b,c);
  input a,b;
  output c;
  
  //assign c=(a|b);
  
  //or(c,a,b);
  
  
  /*output reg c;
  always @(a,b)
    
    begin
      /*case({a,b})
        2'b00:c<=0;
        2'b01:c<=1;
        2'b10:c<=1;
        2'b11:c<=1;
      endcase//
      
      
      if(a==0 && b==0) c=0;
      else if(a==0 && b==1) c=1;
      else if(a==1 && b==0) c=1;
      else if(a==1 && b==1) c=1;
    end */
  
  or_struct g1(a,b,c);
endmodule

module or_struct(x,y,z);
  input x,y;
  output z;
  
  or(z,x,y);
  
endmodule