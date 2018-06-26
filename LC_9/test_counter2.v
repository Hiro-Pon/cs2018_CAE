module test_counter();

reg clk, res;
wire [3:0] out;

counter counter_one(.clk(clk),.res(res),.q(out));
always #100 begin
    clk<=~clk;
end

initial begin
    $monitor("%t: clk = %b,res = %b out = %b,",$time ,clk,res,out);
    clk<= 0;
    res <= 1;
    #200 res <= 0;
    #300 res <= 1;
    #100 res <= 0;
    #1400
    $finish;
end

endmodule