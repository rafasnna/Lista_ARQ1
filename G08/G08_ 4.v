module bitComparator(output desigual, input a, input b);
    xor XOR1(desigual, a, b);
endmodule

module inequalityComparator(output desigual, input [5:0] a, input [5:0] b);
    wire [5:0] comparacao;
    
    genvar i;
    generate
        for (i = 0; i < 6; i = i + 1) begin : compLoop
            bitComparator BC(comparacao[i], a[i], b[i]);
        end
    endgenerate

    assign desigual = |comparacao; // Se algum bit for diferente, retorna 1
endmodule

module test_inequalityComparator;
    reg [5:0] x;
    reg [5:0] y;
    wire desigual;
    inequalityComparator IC(desigual, x, y);

    initial begin
        $display("Guia_0804 - Comparador de Desigualdade");
        $display("x       y       Desigual");

        x = 6'b000110; y = 6'b000110; #10;
        $display("%b %b %b", x, y, desigual);

        x = 6'b101011; y = 6'b101010; #10;
        $display("%b %b %b", x, y, desigual);

        x = 6'b111111; y = 6'b000000; #10;
        $display("%b %b %b", x, y, desigual);

        x = 6'b000000; y = 6'b111111; #10;
        $display("%b %b %b", x, y, desigual);

        $finish;
    end
endmodule
