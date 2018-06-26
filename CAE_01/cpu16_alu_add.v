module cpu16_alu_add(A, B, OUT);
 input [15:0]A,B;
 output[15:0]OUT;
 wire[15:0]C;

 cpu16_alu_fa fa0(A[0],B[0],1'b0,OUT[0],C[0]);
 cpu16_alu_fa fa1(A[1],B[1],C[0],OUT[1],C[1]);
 cpu16_alu_fa fa2(A[2],B[2],C[1],OUT[2],C[2]);
 cpu16_alu_fa fa3(A[3],B[3],C[2],OUT[3],C[3]);
 cpu16_alu_fa fa4(A[4],B[4],C[3],OUT[4],C[4]);
 cpu16_alu_fa fa5(A[5],B[5],C[4],OUT[5],C[5]);
 cpu16_alu_fa fa6(A[6],B[6],C[5],OUT[6],C[6]);
 cpu16_alu_fa fa7(A[7],B[7],C[6],OUT[7],C[7]);
 cpu16_alu_fa fa8(A[8],B[8],C[7],OUT[8],C[8]);
 cpu16_alu_fa fa9(A[9],B[9],C[8],OUT[9],C[9]);
 cpu16_alu_fa fa10(A[10],B[10],C[9],OUT[10],C[10]);
 cpu16_alu_fa fa11(A[11],B[11],C[10],OUT[11],C[11]);
 cpu16_alu_fa fa12(A[12],B[12],C[11],OUT[12],C[12]);
 cpu16_alu_fa fa13(A[13],B[13],C[12],OUT[13],C[13]);
 cpu16_alu_fa fa14(A[14],B[14],C[13],OUT[14],C[14]);
 cpu16_alu_fa fa15(A[15],B[15],C[14],OUT[15],C[15]);

endmodule // cpu16_alu_add(A, B, OUT);


module cpu16_alu_fa ( A, B, Cin, R, Cout );
input A, B, Cin;
output R, Cout;

cpu16_alu_ha ha1(A, B, TR, TC1);
cpu16_alu_ha ha2(Cin, TR, R, TC2);

assign Cout = TC1 | TC2;
endmodule

module cpu16_alu_ha ( A, B, R, C );
input A, B;
output R, C;

assign R = (A&~B)|(~A&B);
assign C = A&B;

endmodule