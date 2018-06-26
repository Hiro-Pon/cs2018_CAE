module test_cpu16_alu_ha;
reg A, B;
wire R, C;
cpu16_alu_ha ma1 (A, B, R, C);
initial begin
    $dumpfile("test_cpu16_alu_ha.vcd");
    $dumpvars(0, test_cpu16_alu_ha);
    $monitor ("%t: A =%b, B =%b, R = %b, C = %b", $time, A, B, R, C);
    A = 0; B = 0;
    #10 A = 1;
    #10 A = 0; B = 1;
    #10 A = 1;
    #10 A = 0; B = 0;
    #10 $finish;
end
endmodule