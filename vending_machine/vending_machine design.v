//vending_machine
module vending_machine(xin,clk,reset,y_out,new_state);
  input [3:0]xin;
  input clk,reset;
  output reg y_out;
  output reg [3:0]new_state;
  reg [3:0]state;
  
  
  parameter S0 =4'b0000,S1 =4'b0101,S2 =4'b1010,S3 =4'b1111;
  always @(posedge clk,reset) begin
    if(reset==0) state<=S0;
    else
      case(state)
        S0: if(xin==4'b0101) state=S1;else if(xin==4'b1010) state=S2; else state=S0;
        S1: if(xin==4'b0101) state=S2;else if(xin==4'b1010) state=S3; else state=S1;
        S2: if(xin==4'b0101) state=S3;else if(xin==4'b1010) state=S3; else state=S2;
        S3:  state=S0;
    endcase
    end
      
  assign y_out=(state==S3);
  assign new_state=state;
  
endmodule