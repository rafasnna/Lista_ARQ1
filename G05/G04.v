

module f5a (output s,
input a, 
input b);

wire not_b;

nand NAND1 (not_b, b,b); 
nand NAND2 (s, not_b, a); 
endmodule 

module f5b (output s,
input a,
input b);

assign s = ~(a & ~b);
endmodule

module guia_0504;
reg x, y;
wire a, b;
f5a moduleA(a, x, y);
f5b moduleB(b, x, y);

initial 
begin: main
$display("04");
$display(" x  y  a  b");
$monitor("%4b %4b %4b %4b", x,y,a,b);

x = 1'b0; y = 1'b0;
#1 x = 1'b0; y = 1'b1;
#1 x = 1'b1; y = 1'b0;
#1 x = 1'b1; y = 1'b1;

end 
endmodule