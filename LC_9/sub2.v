module sub2(A,B,OUT);
    input A[15:0], B[15:0];
    output OUT[15:0];


    B =  ~B
    assign OUT = A + B;

endmodule
