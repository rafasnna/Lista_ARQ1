module complemento1(output [4:0] complemento, input [4:0] b, input select);
    assign complemento = select ? ~b : b; // Inverte B se select = 1
endmodule

module fullAdder(output sum, output carryOut, input a, input b, input carryIn);
    wire s1, c1, c2;
    xor XOR1(s1, a, b);
    xor XOR2(sum, s1, carryIn);
    and AND1(c1, a, b);
    and AND2(c2, s1, carryIn);
    or OR1(carryOut, c1, c2);
endmodule

module arithmeticUnit(output [4:0] result, output carryOut, output igualdade, output desigualdade, 
                      input [4:0] a, input [4:0] b, input carryIn, input chave);
    wire [4:0] complemento;
    wire [3:0] carry;
    wire [4:0] igualdadeBits;

    complemento1 C1(complemento, b, carryIn);

    fullAdder FA0(result[0], carry[0], a[0], complemento[0], carryIn);
    fullAdder FA1(result[1], carry[1], a[1], complemento[1], carry[0]);
    fullAdder FA2(result[2], carry[2], a[2], complemento[2], carry[1]);
    fullAdder FA3(result[3], carry[3], a[3], complemento[3], carry[2]);
    fullAdder FA4(result[4], carryOut, a[4], complemento[4], carry[3]);

    generate
        genvar i;
        for (i = 0; i < 5; i = i + 1) begin : compLoop
            xnor XNOR1(igualdadeBits[i], a[i], b[i]);
        end
    endgenerate

    assign igualdade = &igualdadeBits;
    assign desigualdade = |(igualdadeBits ^ 5'b11111); // Complemento da igualdade

    assign result = chave ? {4'b0000, igualdade} : result;
endmodule

module test_arithmeticUnit;
    reg [4:0] x, y;
    reg carryIn, chave;
    wire [4:0] result;
    wire carryOut, igualdade, desigualdade;

    arithmeticUnit AU(result, carryOut, igualdade, desigualdade, x, y, carryIn, chave);

    initial begin
        $display("Guia_0806 - Somador Algébrico");
        $display("x       y       CarryIn Chave    Resultado    Igualdade  Desigualdade");

        x = 5'b01100; y = 5'b00110; carryIn = 0; chave = 0; #10;
        $display("%b %b %b       %b       %b      %b         %b", x, y, carryIn, chave, result, igualdade, desigualdade);

        x = 5'b01100; y = 5'b00110; carryIn = 1; chave = 0; #10;
        $display("%b %b %b       %b       %b      %b         %b", x, y, carryIn, chave, result, igualdade, desigualdade);

        x = 5'b01100; y = 5'b01100; carryIn = 0; chave = 1; #10;
        $display("%b %b %b       %b       %b      %b         %b", x, y, carryIn, chave, result, igualdade, desigualdade);

        x = 5'b01100; y = 5'b01010; carryIn = 0; chave = 1; #10;
        $display("%b %b %b       %b       %b      %b         %b", x, y, carryIn, chave, result, igualdade, desigualdade);

        $finish;
    end
endmodule
