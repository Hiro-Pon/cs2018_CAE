module my_nand ( A, B, S, R);
    input A, B, S;
    output R;

    assign  R = ((A & ~S) | (S & B));
endmodule