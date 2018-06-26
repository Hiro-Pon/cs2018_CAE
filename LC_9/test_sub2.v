module test_sub2;
    reg [15:0] A,B;
    wire [15:0] OUT;

    sub2 subsub(A,B,OUT);
    initial begin
      $monitor ("%t: A = %b, B = %b, OUT = %b", $time, A, B, OUT);
      A <= 16'b0000000000001100;
      B <= 16'b0000000000001100;
    end
endmodule