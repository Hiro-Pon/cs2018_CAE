module test_my_xor;
reg a, b;
wire out;
my_xor hoge (a, b, out);
initial begin
    $dumpvars(0, test_my_xor);
    $monitor ("%t: a =%b, b =%b, out = %b", $time, a, b, out);
    a = 0; b = 0;
    #10 a = 1;
    #10 a = 0; b = 1;
    #10 a = 1;
    #10 a = 0; b = 0;
    #10 $finish;
end
endmodule