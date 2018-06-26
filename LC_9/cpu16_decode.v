`define ISADD 0
`define ISSUB 1
`define ISAND 2
`define ISOR 3
module cpu16_decode( IR, ICNT, DEST, SRC );
input [15:0] IR;
output [3:0] ICNT, DEST, SRC;
reg [3:0] icnt;
always @( IR )
  casez ( { IR[15:12], IR[7:4] } )
    16'b0000_1010: icnt = ( 1'b1 << `ISADD );	// ADD 0001
    16'b0000_0010: icnt = ( 1'b1 << `ISSUB );	// SUB 0010
    16'b0000_1100: icnt = ( 1'b1 << `ISAND );	// AND 0100
    16'b0000_1110: icnt = ( 1'b1 << `ISOR );	// OR   1000
    default: icnt = 4'bxxxx;
  endcase
assign ICNT = icnt;
assign DEST = IR[11:8];
assign SRC = IR[3:0];
endmodule
