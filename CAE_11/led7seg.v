module led7seg (a, b, LED,SA);
    input a, b;
    output [7:0]LED;
    output [3:0]SA;

    assign  SA = 4'bZZZ0;
    assign  LED[0] = ~a & b;
    assign  LED[1] = 1'b0;
    assign  LED[2] = a & ~b;
    assign  LED[3] = ~a & b;
    assign  LED[4] = ~a;
    assign  LED[5] = ~a | ~b;
    assign  LED[6] = b;
    assign  LED[7] = 1'b1;
endmodule
