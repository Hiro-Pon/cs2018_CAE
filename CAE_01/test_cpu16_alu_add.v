module test_cpu16_alu_add;
reg [15:0]A,B;
wire [15:0]OUT;
cpu16_alu_add ma1 ( A, B, OUT);
initial begin
    $dumpfile("test_cpu16_alu_add.vcd");
    $dumpvars(0, test_cpu16_alu_add);
    $monitor ("%t: A =%b, B =%b, OUT = %b", $time, A, B,OUT);
    A=1024;B = 1;
    #10 B = 1024;
    #10 A = 65534; B = 1;
    #10 A = 65535; B = 1;
    #10 $finish;
    
end
endmodule