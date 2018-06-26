module cpu16_alu_ha ( A, B, R, C );
input A, B;
output R, C;

assign R = (A&~B)|(~A&B);
assign C = A&B;

endmodule