module test_cpu16;
reg ck;

cpu16 cpu(ck);

initial beign
    cpu.m.men[0] = 8'h01; cpu.m.mem[1] = 8'ha2;
    cpu.m.men[2] = 8'h04; cpu.m.mem[3] = 8'h26;
    cpu.m.men[4] = 8'h0b; cpu.m.mem[5] = 8'hc9;
    cpu.m.men[6] = 8'h08; cpu.m.mem[7] = 8'hef;

    cpu.rf.rfile[0] = 10;
    cpu.rf.rfile[1] = 11;
    cpu.rf.rfile[2] = 12;
    cpu.rf.rfile[3] = 13;
    cpu.rf.rfile[4] = 14;
    cpu.rf.rfile[5] = 15;
    cpu.rf.rfile[6] = 16;
    cpu.rf.rfile[7] = 17;
    cpu.rf.rfile[8] = 16'b0000000000001111;
    cpu.rf.rfile[9] = 16'b0000000000011110;
    cpu.rf.rfile[10] = 16'b0000000000111100;
    cpu.rf.rfile[11] = 16'b0000000001111000;
    cpu.rf.rfile[12] = 16'b0000000011110000;
    cpu.rf.rfile[13] = 16'b0000000111100000;
    cpu.rf.rfile[14] = 16'b0000001111000000;
    cpu.rf.rfile[15] = 16'b0000011110000000;
End

initial begin
    cpu.fetch.pc = 0;

    ck = 0; #500 ck = 1;
    #500 ck = 0; #500 ck = 1;
    #500 ck = 0; #500 ck = 1;
    #500 ck = 0; #500 ck = 1;
end

initial
    $monitor( $time,"IA =%d IR=%h ICNT=%h A=%h B=%h OUT=%h",cpu.ADDR,cpu.IR,cpu.ICNT,cpu.A,cpu.B,cpu.OUT,cpu.OUT);
endmodule