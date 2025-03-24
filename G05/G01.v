module f5a (output s,
input a, 
input b);

wire not_a;

nor NOR1 (not_a, a,a); 
nor NOR2 (s, not_a, b); 
endmodule 

module f5b (output s,
input a,
input b);

assign s = a & ~b;
endmodule

module guia_0501;
reg x, y;
wire a, b;
f5a moduleA(a, x, y);
f5b moduleB(b, x, y);

initial 
begin: main
$display("01");
$display(" x  y  a  b");
$monitor("%4b %4b %4b %4b", x,y,a,b);

x = 1'b0; y = 1'b0;
#1 x = 1'b0; y = 1'b1;
#1 x = 1'b1; y = 1'b0;
#1 x = 1'b1; y = 1'b1;

end 
endmodule
