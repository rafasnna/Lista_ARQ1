module f5a (output s, input a, input b);
wire not_a;
not NOT1 (not_a, a); 
and AND1 (s, not_a, b);
endmodule

module f5b (output s, input a, input b);
assign s = ~a & b;
endmodule

module test_f5;
reg x, y;
wire a, b;

f5a moduloA (a, x, y);
f5b moduloB (b, x, y);

initial
begin : main
    $display("00");
    $display(" x  y  a  b ");
    $monitor(" %b  %b  %b  %b ", x, y, a, b);
    x = 1'b0; y = 1'b0;
    #1 x = 1'b0; y = 1'b1;
    #1 x = 1'b1; y = 1'b0;
    #1 x = 1'b1; y = 1'b1;
end
endmodule