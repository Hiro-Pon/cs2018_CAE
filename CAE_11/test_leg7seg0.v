module test_led7seg;
reg a ,b;
wire [7:0]LED;
wire [3:0]SA;
led7seg ma1 (a, b, LED,SA);
initial begin
    $dumpfile("test_led7seg.vcd");
    $dumpvars(0, test_led7seg);
    $monitor ("\n%t: a =%b, b =%b, \n  %b\n%b   %b\n  %b\n%b   %b\n  %b  \n     (%b)", $time, a, b, LED[0],LED[5], LED[1], LED[6], LED[4], LED[2], LED[3],LED[7]);
    a = 1; b = 1;
    #10 a = 0;
    #10 a = 1; b = 0;
    #10 a = 0; b = 0;
    #10 $finish;
end
endmodule
