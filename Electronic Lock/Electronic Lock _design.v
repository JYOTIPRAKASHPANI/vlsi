// Code your design here
module detect_01011(clk,reset,b0,b1,unlock);
  input clk,reset,b0,b1;
  output unlock;
  reg out;
  parameter S0 =0,
            S1 =1,
            S2 = 2,
            S3 =3,
            S4 = 4,
            S5 = 5;
  reg [2:0]cur_state,next_state;
  
  
  always @(posedge clk)
    begin
      if(reset)
        cur_state<=S0;
      else
        begin
          cur_state=next_state;
        end
    end
  always @(cur_state or b0 or b1)
    begin
      case(cur_state)
        S0:begin
          if(b0==0 && b1==1) next_state =S0;
          else next_state =S1;
          
        end
        
        S1: begin
          if(b0==0 && b1==1) next_state =S2;
          else next_state =S1;
        end
        
        S2: begin
          if(b0==0 && b1==1) next_state =S0;
          else next_state =S3;
        end
        
        S3: begin
          if(b0==0 && b1==1) next_state =S4;
          else next_state =S1;
        end
        
        S4: begin
          if(b0==0 && b1==1) next_state =S5;
          else next_state =S3;
        end
        
        S5: begin
          if(b0==0 && b1==1) next_state =S0;
          else next_state =S1;
        end
        
      endcase
    end
  always @(posedge clk) begin
      out=(cur_state == S5 ? 1:0);
  end
  assign unlock=out;
endmodule