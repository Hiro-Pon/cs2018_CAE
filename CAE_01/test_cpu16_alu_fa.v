module test_cpu16_alu_fa;
reg A, B, Cin;
wire R, Cout;
cpu16_alu_fa ma1 ( A, B, Cin, R, Cout );
initial begin
    $dumpfile("test_cpu16_alu_fa.vcd");
    $dumpvars(0, test_cpu16_alu_fa);
    $monitor ("%t: A =%b, B =%b, Cin = %b, R = %b, Cout = %b", $time, A, B, Cin, R, Cout );
    A = 0; B = 0; Cin = 0;
    #10 Cin = 1;
    #10 B = 1; Cin = 0;
    #10 Cin = 1;
    #10 A = 1; B = 0; Cin = 0;
    #10 Cin = 1;
    #10 B = 1;Cin = 0;
    #10 Cin = 1;
    #10 $finish;
end
endmodule
