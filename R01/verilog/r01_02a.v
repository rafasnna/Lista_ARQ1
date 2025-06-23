module mux (output sa, input a, input b);
    wire not_b;

    not NOT1 (not_b, b);
    assign sa = (a) ? b : not_b;
endmodule

module guia_0702;
    reg a, b;
    wire sa;

    mux moduloA (sa, a, b);

    initial
    begin
        $display("recuperacao 2a - Izadora Galarza Alves");
        $display(" a b | sa");
        $monitor(" %b %b | %b", a, b, sa);

        a = 0; b = 0; #1;
        a = 0; b = 1; #1;
        a = 1; b = 0; #1;
        a = 1; b = 1; #1;
    end
endmodule
