// Code your design here
module fsm_mealy(xin,clk,reset,y_out,new_state);
  input xin,clk,reset;
  output reg y_out;
  output reg [1:0]new_state;
  reg [1:0]state;
  
  
  parameter S0 =2'b00,S1 =2'b01,S2 =2'b10,S3 =2'b11;
  always @(posedge clk ,negedge reset) begin
    if(reset==0) state<=S0;
    else 
      case(state)
        S0: if(xin) state=S1;else state=S0;
        S1: if(xin) state=S2;else state=S1;
        S2: if(xin) state=S3;else state=S2;
        S3: if(xin) state=S0;else state=S3; 
    endcase
   end
  assign y_out=(state==S3);
  assign new_state=state;
  
endmodule