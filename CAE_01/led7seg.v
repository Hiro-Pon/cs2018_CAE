module led7seg (a, b, A, B, C, D, E, F, G);
    input a, b;
    output A,B,C,D,E,F,G;

    assign  Y = ~ (A & B);
    assign  A = a & ~b;
    assign  B = 0;
    assign  C = ~a & ~b;
    assign  D = a & ~b;
    assign  E = a;
    assign  F = a | b;
    assign  G = ~b;
endmodule