module dflipfflop(clk,d,out);
input clk , d;
output reg out;

always @(posedge clk) begin
 out <= d;
end
endmodule