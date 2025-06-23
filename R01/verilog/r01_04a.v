module exp_4 (output s, input a, input b, input c);
    assign s = ~(~a | (b & c));
endmodule

module guia_0702;
    reg a, b, c;
    wire s;

    exp_4 moduloE (s, a, b, c);

    initial
    begin
        $display("recuperacao 4a - Izadora Galarza Alves");
        $display(" a b c | s");
        $monitor(" %b %b %b | %b", a, b, c, s);

        a = 0; b = 0; c = 0; #1;
        a = 0; b = 1; c = 1; #1;
        a = 1; b = 0; c = 1; #1;
        a = 1; b = 1; c = 1; #1;
    end
endmodule
