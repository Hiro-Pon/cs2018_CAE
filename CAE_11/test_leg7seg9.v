module test_led7seg;
reg [3:0]I;
wire [7:0]LED;
wire [3:0]SA;
led7seg9 ma1 (I, LED,SA);
initial begin
    $dumpfile("test_led7seg.vcd");
    $dumpvars(0, test_led7seg);
    $monitor ("%t: I =%b, LED[0] =%b, LED[1] =%b, LED[2] =%b, LED[3] =%b, LED[4] =%b, LED[5] =%b, LED[6] =%b", $time, I, LED[0],LED[1], LED[2], LED[3], LED[4], LED[5], LED[6]);
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
