module test_cpu16_decode();
reg [15:0] IR;
wire [3:0] ICNT, DEST, SRC;

cpu16_decode cpu16_decode1(.IR(IR), .ICNT(ICNT), .DEST(DEST), .SRC(SRC));

initial begin
    $dumpfile("test_cpu16_decode.vcd");
    $dumpvars(0, test_cpu16_decode);
    $monitor ("%t: IR = %b, IR = %h, ICNT = %h", $time, IR,  IR, ICNT);
    
    // ADD
    IR = 16'b0000_0010_1010_0010;
    
    // SUB
    #10 IR = 16'b0000_0010_0010_0010;
    
    // AND
    #10 IR = 16'b0000_0010_1100_0010;
   
    // OR
    #10 IR = 16'b0000_0010_1110_0010;
   
    #0 
    $finish;
end


endmodule