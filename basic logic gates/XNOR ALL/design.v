// Code your design here
module xnor1(a,b,c);
  input a,b;
  output c;
  //assign c=~(a^b);
  
  //xnor(c,a,b); 
  /*output reg c;
  always @(a,b)
    
    begin
      /*case({a,b})
        2'b00:c<=1;
        2'b01:c<=0;
        2'b10:c<=0;
        2'b11:c<=1;
      endcase//
      
      
      if(a==0 && b==0) c=1;
      else if(a==0 && b==1) c=0;
      else if(a==1 && b==0) c=0;
      else if(a==1 && b==1) c=1;
    end */
  
  xnor_struct g1(a,b,c);
endmodule

module xnor_struct(input x,y, output z);
  xnor(z,x,y);
endmodule