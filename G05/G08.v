

module f5a ( output s,
input a,
input b);

wire not_a, not_b, and1;

nand NAND1 (not_a,a,a);
nand NAND2 (not_b,b,b);
nand NAND3 (and1, not_a, not_b);
nand NAND4 (s, and1, and1);
endmodule

module f5b (output s, 
input a,
input b);

assign s= ~a | ~b;
endmodule 

module guia_0508;
reg x,y;
wire a,b;

f5a moduleA( a,x,y);
f5b moduleB( b,x,y);

initial 
begin: main
$display("08");
$display(" x  y  a  b");
$monitor("%4b %4b %4b %4b", x,y,a,b);

x = 1'b0; y = 1'b0;
#1 x = 1'b0; y = 1'b1;
#1 x = 1'b1; y = 1'b0;
#1 x = 1'b1; y = 1'b1;

end
endmodule
