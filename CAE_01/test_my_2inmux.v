module test_my_2inmux;
reg a, b, s;
wire out;
my_nand ma1 (a, b, s, out);
initial begin
    $dumpfile("test_my_2inmux.vcd");
    $dumpvars(0, test_my_2inmux);
    $monitor ("%t: a =%b, b =%b, s=%d, out = %b", $time, a, b, s, out);
    a = 0; b = 0;
    #10 a = 1;
    #10 a = 0; b = 1;
    #10 a = 1;
    #10 a = 0; b = 0;
    #10 $finish;
end
endmodule