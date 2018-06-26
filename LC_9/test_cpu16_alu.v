module test_cpu16_alu;
reg [15:0] A, B;
reg [3:0] ICNT;
wire [15:0] OUT;

cpu16_alu cpu16_alu1( .A(A), .B(B), .ICNT(ICNT), .OUT(OUT) );

initial begin
    $dumpfile("test_cpu16_alu.vcd");
    $dumpvars(0, test_cpu16_alu);
    $monitor ("%t: A = %b, B = %b, ICNT = %h, OUT = %b", $time, A, B, ICNT, OUT);
    
    // ADD
    ICNT <= 4'b0001;
    A <= 1;
    B <= 10;
    
    // SUB
    #10 ICNT <=   4'b0010;
    A <= 10;
    B <= 1;
    
    // AND
    #10 ICNT <=  4'b0100;
    A <=  16'b0000000000001100;
    B <=  16'b0000000000001010;
   
    // OR
    #10 ICNT <=   4'b1000;
    A <=  16'b0000000000001100;
    B <=  16'b0000000000001010;
  
    $finish;
end


endmodule