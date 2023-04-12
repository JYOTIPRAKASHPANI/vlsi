// Code your design here
module trafic_light(clk,Dreset,forMR,forMY,forMG,forSR,forSY,forSG,Dss,eout); //DSS-> INPUT FOR SIDE VECHILE
  //MR- FOR MAIN ROAD RED
  //SR- FOR SIDE ROAD RED
  input clk,Dreset,Dss;
  output reg forMR,forMY,forMG,forSR,forSY,forSG;
  output reg [2:0]eout;
  reg [2:0]col,scol;//scol-side colour
  reg [2:0]cur_state,next_state;
  parameter  S001=0,//S-> for MAIN ROAD
             S010=1,
             S100=2,
             SS001=3,//SS->for SIDE ROAD
             SS010=4,
             SS100=5;
  
  always @(posedge clk,Dreset) begin
    
    if(Dreset)
      cur_state=S001;
      
    else
      begin
        cur_state=next_state;
        eout=cur_state;
        forMR=col[2];
        forMY=col[1];
        forMG=col[0];
        
        forSR=scol[2];
        forSY=scol[1];
        forSG=scol[0];
      end
  end
  always @(cur_state or Dss )
    begin
      case(cur_state)
        S001:begin
              if(Dss) begin 
                next_state=S010;
                col=3'b010;
                scol=3'b100;
              end
              else begin 
                next_state=S001;
                col=3'b001;
                scol=3'b100;
              end
        end
        S010:begin
                if(Dss) begin 
                  next_state=S100;
                  col=3'b100;
                  scol=3'b001;
                end
                else begin 
                  next_state=S010;
                  col=3'b010;
                  scol=3'b100;
                end
        end
        S100:begin
                if(Dss) begin 
                  next_state=SS001;
                  col=3'b100;
                  scol=3'b001;
                end
                else begin 
                  next_state=S001;
                  col=3'b001;
                  scol=3'b100;
                end
        end
        SS001:begin
                if(~Dss) begin 
                  next_state=SS010;
                  col=3'b100;
                  scol=3'b010;
                end
                else begin 
                  next_state=SS001;
                  col=3'b100;
                  scol=3'b001;
                end
        end
        SS010:begin
                if(~Dss) begin 
                  next_state=SS100;
                  col=3'b001;
                  scol=3'b100;
                end
                else begin
                  next_state=SS001;
                  col=3'b100;
                  scol=3'b001;
                end
        end
        SS100:begin
                if(~Dss) begin 
                  next_state=S001;
                  col=3'b001;
                  scol=3'b100;
                end
                else begin 
                  next_state=SS001;
                  col=3'b100;
                  scol=3'b001;
                end
        end
      endcase
    end
endmodule