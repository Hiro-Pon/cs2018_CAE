module led7seg9 (I,LED,SA);
    input [3:0]I;
    output [7:0]LED;
    output [3:0]SA;

    assign  SA = 4'bZZZ0;
    assign  LED[0] = (~I[0] & I[1] & I[2] & I[3] )^(I[0] & I[1] & ~I[2] & I[3])^(I[0] & ~I[1] & ~I[2] & I[3]);
    assign  LED[1] = (~I[0] & I[1] & ~I[2] & I[3])^(I[0] & ~I[1] & ~I[2] & I[3]);
    assign  LED[2] = I[0] & ~I[1] &I[2] & I[3];
    assign  LED[3] = (~I[0] & I[1] &I[2] & I[3])^(I[0] & I[1] & ~I[2] & I[3])^(~I[0] & I[1] &I[2] & ~I[3]);
    assign  LED[4] = (~I[0] & I[1]) ^ (~I[0] & ~I[1]) ^ (I[0] & I[1] & ~I[2] & I[3]);
    assign  LED[5] = (~I[0] & I[1] &I[2] & I[3]) ^ (~I[0] & ~I[1]) ^ (~I[1] & I[2] & I[3]);
    assign  LED[6] = I[1];
    assign  LED[7] = 1'b1;
endmodule
