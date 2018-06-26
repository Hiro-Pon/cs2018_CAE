module test_led7seg;
reg a ,b;
wire [7:0]LED;
wire [3:0]SA;
led7seg ma1 (a, b, LED,SA);
initial begin
    $dumpfile("test_led7seg.vcd");
    $dumpvars(0, test_led7seg);
    $monitor ("%t: a =%b, b =%b, LED[0] =%b, LED[1] =%b, LED[2] =%b, LED[3] =%b, LED[4] =%b, LED[5] =%b, LED[6] =%b", $time, a, b, LED[0],LED[1], LED[2], LED[3], LED[4], LED[5], LED[6]);
    a = 0; b = 0;
    #10 a = 1;
    #10 a = 0; b = 1;
    #10 a = 1;
    #10 a = 0; b = 0;
    #10 $finish;
end
endmodule
