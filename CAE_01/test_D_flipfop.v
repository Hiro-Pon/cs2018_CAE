module test_dflipfflop();
reg clk, res;
wire out;

dflipfflop dflipfflop1(.clk(clk),.d(res),.out(out));
always #10 begin
    clk<=~clk;
end

initial begin

    $monitor("%t: clk = %b,d = %b out = %b,",$time ,clk,res,out);
    clk<= 0;
    res <= 1'b0;
    #10 res <= 1'b1;
    #40 res <= 1'b0;
    #20 res <= 1'b1;
    #30
    $finish;
end

endmodule