module exp_3a (output s, input a, input b, input d);
    assign s = (~a & d) | (a & ~b);
endmodule

module guia_0702;
    reg a, b, d;
    wire s;

    exp_3a moduloC (s, a, b, d);

    initial
    begin
        $display("recuperacao 3a - Izadora Galarza Alves");
        $display(" a b d | s");
        $monitor(" %b %b %b | %b", a, b, d, s);

        a = 0; b = 0; d = 0; #1;
        a = 0; b = 1; d = 1; #1;
        a = 1; b = 0; d = 0; #1;
        a = 1; b = 1; d = 1; #1;
    end
endmodule
