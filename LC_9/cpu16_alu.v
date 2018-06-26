`define ISADD 0
`define ISSUB 1
`define ISAND 2
`define ISOR 3

module cpu16_alu( A, B, ICNT, OUT );
input [15:0] A, B;
input [3:0] ICNT;
output [15:0] OUT;
reg [15:0] a, b, r;
reg cin;
always @( A or B or ICNT )
  if ( ICNT[`ISADD] | ICNT[`ISSUB] ) begin
    a = A;
    b = ( ICNT[`ISSUB] ? ~B : B );
    cin = ( ICNT[`ISSUB] ? 1'b1 : 1'b0 );
    r = a + b + cin;
  end
  else if ( ICNT[`ISAND] )
    r = A & B;
  else if ( ICNT[`ISOR] )
    r = A | B;
  else
    r = 16'hxxxx;

assign OUT = r;
endmodule
