module counter(clk,res, q);

input clk,res;
output reg [3:0] q;
always @( posedge clk) begin
    case (res)
      1: q = 0; 
      default: q += 2; 
    endcase
         
end

endmodule