module complemento1(output [5:0] complemento, input [5:0] a);
    assign complemento = ~a; // Inverte todos os bits
endmodule

module fullAdder(output s, output carryOut, input a, input b, input carryIn);
    wire s1, c1, c2;
    xor XOR1(s1, a, b);
    xor XOR2(s, s1, carryIn);
    and AND1(c1, a, b);
    and AND2(c2, s1, carryIn);
    or OR1(carryOut, c1, c2);
endmodule

module complemento2(output [5:0] resultado, output carryOut, input [5:0] a);
    wire [5:0] complemento;
    wire [4:0] carry;

    complemento1 C1(complemento, a);

    fullAdder FA0(resultado[0], carry[0], complemento[0], 1'b1, 1'b0);
    fullAdder FA1(resultado[1], carry[1], complemento[1], 1'b0, carry[0]);
    fullAdder FA2(resultado[2], carry[2], complemento[2], 1'b0, carry[1]);
    fullAdder FA3(resultado[3], carry[3], complemento[3], 1'b0, carry[2]);
    fullAdder FA4(resultado[4], carry[4], complemento[4], 1'b0, carry[3]);
    fullAdder FA5(resultado[5], carryOut, complemento[5], 1'b0, carry[4]);
endmodule

module test_complemento2;
    reg [5:0] x;
    wire [5:0] resultado;
    wire carryOut;

    complemento2 C2(resultado, carryOut, x);

    initial begin
        $display("Guia_0805 - Complemento de 2");
        $display("x       Complemento de 2");

        x = 6'b000011; #10; // 3 decimal
        $display("%b %b", x, resultado);

        x = 6'b111100; #10; // -4 decimal
        $display("%b %b", x, resultado);

        x = 6'b000000; #10; // 0 decimal
        $display("%b %b", x, resultado);

        x = 6'b111111; #10; // -1 decimal
        $display("%b %b", x, resultado);

        $finish;
    end
endmodule
