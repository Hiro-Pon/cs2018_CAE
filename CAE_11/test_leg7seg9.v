module test_led7seg;
reg [3:0]I;
wire [7:0]LED;
wire [3:0]SA;
led7seg9 ma1 (I, LED,SA);
initial begin
    $dumpfile("test_led7seg.vcd");
    $dumpvars(0, test_led7seg);
    $monitor ("\n%t: I = %b, \n  %b\n%b   %b\n  %b\n%b   %b\n  %b  \n     (%b)", $time, I, LED[0],LED[5], LED[1], LED[6], LED[4], LED[2], LED[3],LED[7]);
    I = 4'b1111;
    #10 I = 4'b1110;
    #10 I = 4'b1101;
    #10 I = 4'b1100;
    #10 I = 4'b1011;
    #10 I = 4'b1010;
    #10 I = 4'b1001;
    #10 I = 4'b1000;
    #10 I = 4'b0111;
    #10 I = 4'b0110;
    #10 I = 4'b0101;
    #10 I = 4'b0100;
    #10 I = 4'b0011;
    #10 I = 4'b0010;
    #10 I = 4'b0001;
    #10 I = 4'b0000;
    #10 $finish;
end
endmodule
