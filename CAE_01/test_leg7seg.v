module test_led7seg;
reg a ,b;
wire A, B, C, D, E, F, G;
led7seg ma1 (a, b, A, B, C, D, E, F, G);
initial begin
    $dumpfile("test_led7seg.vcd");
    $dumpvars(0, test_led7seg);
    $monitor ("%t: a =%b, b =%b, A =%b, B =%b, C =%b, D =%b, E =%b, F =%b, G =%b", $time, a, b, A, B, C, D, E, F, G);
    a = 0; b = 0;
    #10 a = 1;
    #10 a = 0; b = 1;
    #10 a = 1;
    #10 a = 0; b = 0;
    #10 $finish;
end
endmodule