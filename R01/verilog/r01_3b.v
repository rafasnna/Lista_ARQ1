module exp_3b (output s, input a, input b, input c, input d);
    assign s = (~a & ~c & d) | (a & ~b) | (~b & d);
endmodule

module guia_0702;
    reg a, b, c, d;
    wire s;

    exp_3b moduloD (s, a, b, c, d);

    initial
    begin
        $display("recuperacao 3b - Izadora Galarza Alves");
        $display(" a b c d | s");
        $monitor(" %b %b %b %b | %b", a, b, c, d, s);

        a = 0; b = 0; c = 0; d = 0; #1;
        a = 0; b = 1; c = 0; d = 1; #1;
        a = 1; b = 0; c = 1; d = 0; #1;
        a = 1; b = 1; c = 1; d = 1; #1;
    end
endmodule
