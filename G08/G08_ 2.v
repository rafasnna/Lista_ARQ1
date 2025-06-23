module halfSubtractor(output d, output borrow, input a, input b);
    xor XOR1(d, a, b);
    and AND1(borrow, ~a, b);
endmodule

module fullSubtractor(output d, output borrowOut, input a, input b, input borrowIn);
    wire hs1_d, hs1_b, hs2_b;
    halfSubtractor HS1(hs1_d, hs1_b, a, b);
    halfSubtractor HS2(d, hs2_b, hs1_d, borrowIn);
    or OR1(borrowOut, hs1_b, hs2_b);
endmodule

module arithmeticUnit(output [5:0] diff, output borrowOut, input [5:0] a, input [5:0] b, input borrowIn);
    wire [4:0] borrow;
    fullSubtractor FS0(diff[0], borrow[0], a[0], b[0], borrowIn);
    fullSubtractor FS1(diff[1], borrow[1], a[1], b[1], borrow[0]);
    fullSubtractor FS2(diff[2], borrow[2], a[2], b[2], borrow[1]);
    fullSubtractor FS3(diff[3], borrow[3], a[3], b[3], borrow[2]);
    fullSubtractor FS4(diff[4], borrow[4], a[4], b[4], borrow[3]);
    fullSubtractor FS5(diff[5], borrowOut, a[5], b[5], borrow[4]);
endmodule

module test_arithmeticUnit;
    reg [5:0] x;
    reg [5:0] y;
    reg borrowIn;
    wire [5:0] diff;
    wire borrowOut;
    arithmeticUnit AU(diff, borrowOut, x, y, borrowIn);
    initial begin
        $display("Guia_0802 - Subtrator Completo");
        x = 6'b000110; 
        y = 6'b000101; 
        borrowIn = 0;
        #10;
        $display("x = %b, y = %b, Diferença = %b, Borrow Out = %b", x, y, diff, borrowOut);
        x = 6'b111100; 
        y = 6'b000011; 
        borrowIn = 1;
        #10;
        $display("x = %b, y = %b, Diferença = %b, Borrow Out = %b", x, y, diff, borrowOut);
        $finish;
    end
endmodule
