
module halfAdder(output s1, output s0, input a, input b);
    xor XOR1(s0, a, b);
    and AND1(s1, a, b);
endmodule

module fullAdder(output s1, output s0, input a, input b, input carryIn);
    wire ha1_s0, ha1_s1, ha2_s1;
    halfAdder HA1(ha1_s1, ha1_s0, a, b);
    halfAdder HA2(ha2_s1, s0, ha1_s0, carryIn);
    or OR1(s1, ha1_s1, ha2_s1);
endmodule

module arithmeticUnit(output [5:0] soma, output carryOut, input [5:0] a, input [5:0] b, input carryIn);
    wire [4:0] carry;
    fullAdder FA0(carry[0], soma[0], a[0], b[0], carryIn);
    fullAdder FA1(carry[1], soma[1], a[1], b[1], carry[0]);
    fullAdder FA2(carry[2], soma[2], a[2], b[2], carry[1]);
    fullAdder FA3(carry[3], soma[3], a[3], b[3], carry[2]);
    fullAdder FA4(carry[4], soma[4], a[4], b[4], carry[3]);
    fullAdder FA5(carryOut, soma[5], a[5], b[5], carry[4]);
endmodule

module test_arithmeticUnit;
    reg [5:0] x;
    reg [5:0] y;
    reg carryIn;
    wire [5:0] soma;
    wire carryOut;
    arithmeticUnit AU(soma, carryOut, x, y, carryIn);
    initial begin
        $display("Guia_0801 - xxx yyy zzz - 999999");
        $display("Test AU’s full adder");
        x = 6'b000110; 
        y = 6'b000101; 
        carryIn = 0;
        #10;
        $display("x = %b, y = %b, Soma = %b, Carry Out = %b", x, y, soma, carryOut);
        x = 6'b111100; 
        y = 6'b000011; 
        carryIn = 1;
        #10;
        $display("x = %b, y = %b, Soma = %b, Carry Out = %b", x, y, soma, carryOut);
        $finish;
    end
endmodule
