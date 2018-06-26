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