module cpu16( CK );
input CK;
wire [15:0] ADDR, DATA, IR, A, B, OUT;
wire [3:0] ICNT, DEST, SRC;

cpu16_fetch fetch( CK, ADDR, DATA, IR );
cpu16_memory m( ADDR, DATA );
cpu16_decode decode( IR, ICNT, DEST, SRC );
cpu16_regfile rf( CK, DEST, DEST, SRC, OUT, A, B );
cpu16_alu alu( A, B, ICNT, OUT );

endmodule

module cpu16_fetch( CK, ADDR, DATA, IR );
input CK;
input [15:0] DATA;
output [15:0] ADDR,IR;
reg [15:0] pc, ir;

always @( posedge CK ) begin
    pc = pc+2;
    ir = DATA;
end

assign ADDR = { pc[15:1], 1'b0 };
assign IR = ir;

endmodule

module cpu16_memory( ADDR, DATA );
input [15:0] ADDR;
output [15:0] DATA;
reg [7:0] mem[0:63];

assign DATA  = { mem[ADDR], mem[ADDR+1] };

endmodule

`define ISADD 0
`define ISSUB 1
`define ISAND 2
`define ISOR  3

module cpu16_decode( IR, ICNT, DEST, SRC );
input [15:0] IR;
output [3:0] ICNT, DEST, SRC;
reg [3:0] icnt;

always @( IR )
  casez ( { IR[15:12], IR[7:4] } )
    16'b0000_1010: icnt = ( 1'b1 << `ISADD );
    16'b0000_0010: icnt = ( 1'b1 << `ISSUB );
    16'b0000_1100: icnt = ( 1'b1 << `ISAND );
    16'b0000_1110: icnt = ( 1'b1 << `ISOR  );
    default:       icnt = 4'bxxxx;
  endcase

assign ICNT = icnt;
assign DEST = IR[11:8];
assign SRC = IR[3:0];

endmodule

module cpu16_regfile( CK, WA, RA1, RA2, WD, RD1, RD2 );
input CK;
input [3:0] WA, RA1, RA2;
input [15:0] WD;
output [15:0] RD1, RD2;
reg [15:0] rfile[0:15];

always @( posedge CK )
  rfile[WA] <= WD;

assign RD1 = rfile[RA1];
assign RD2 = rfile[RA2];

endmodule

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

module test_cpu16;
reg ck;

cpu16 cpu( ck );

initial begin
  cpu.m.mem[0] = 8'h0_1;  cpu.m.mem[1] = 8'ha_3;	// ADD R1, R3
  cpu.m.mem[2] = 8'h0_5;  cpu.m.mem[3] = 8'h2_0;	// SUB R5, R0
  cpu.m.mem[4] = 8'h0_c;  cpu.m.mem[5] = 8'hc_a; 	// AND R13, R10
  cpu.m.mem[6] = 8'h0_8;  cpu.m.mem[7] = 8'he_b; 	// OR R8, R12

  cpu.rf.rfile[0] = 10;
  cpu.rf.rfile[1] = 11;
  cpu.rf.rfile[2] = 12;
  cpu.rf.rfile[3] = 13;
  cpu.rf.rfile[4] = 14;
  cpu.rf.rfile[5] = 15;
  cpu.rf.rfile[6] = 16;
  cpu.rf.rfile[7] = 17;
  cpu.rf.rfile[8] =   16'b0000000000001111;
  cpu.rf.rfile[9] =   16'b0000000000011110;
  cpu.rf.rfile[10] = 16'b0000000000111100;
  cpu.rf.rfile[11] = 16'b0000000001111000;
  cpu.rf.rfile[12] = 16'b0000000011110000;
  cpu.rf.rfile[13] = 16'b0000000111100000;
  cpu.rf.rfile[14] = 16'b0000001111000000;
  cpu.rf.rfile[15] = 16'b0000011110000000;
end

initial begin  
  cpu.fetch.pc = 0;

       ck = 0;  #500 ck = 1;
  #500 ck = 0;  #500 ck = 1;
  #500 ck = 0;  #500 ck = 1;
  #500 ck = 0;  #500 ck = 1;
end

initial
  $monitor( $stime, " IA=%d IR=%h ICNT=%h A=%d B=%d OUT=%d OUT=%h", cpu.ADDR, cpu.IR, cpu.ICNT, cpu.A, cpu.B, cpu.OUT, cpu.OUT );

endmodule