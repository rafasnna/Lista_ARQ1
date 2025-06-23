module bitComparator(output igual, input a, input b);
    xnor XNOR1(igual, a, b);
endmodule

module equalityComparator(output igual, input [5:0] a, input [5:0] b);
    wire [5:0] comparacao;
    
    genvar i;
    generate
        for (i = 0; i < 6; i = i + 1) begin : compLoop
            bitComparator BC(comparacao[i], a[i], b[i]);
        end
    endgenerate

    assign igual = &comparacao; // Se todos os bits forem iguais, retorna 1
endmodule

module test_equalityComparator;
    reg [5:0] x;
    reg [5:0] y;
    wire igual;
    equalityComparator EC(igual, x, y);

    initial begin
        $display("Guia_0803 - Comparador de Igualdade");
        $display("x       y       Igual");
        
        x = 6'b000110; y = 6'b000110; #10;
        $display("%b %b %b", x, y, igual);

        x = 6'b101011; y = 6'b101010; #10;
        $display("%b %b %b", x, y, igual);

        x = 6'b111111; y = 6'b111111; #10;
        $display("%b %b %b", x, y, igual);

        x = 6'b000000; y = 6'b111111; #10;
        $display("%b %b %b", x, y, igual);

        $finish;
    end
endmodule
