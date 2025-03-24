// -------------------------
// Guia_0505.v 
// Nome: Izadora Galarza Alves
// Matricula: 866053
// -------------------------
// -------------------------

module f5a (output s,
input a, 
input b);

wire not_a, not_b, and1, and2 ;

nor NOR1 (not_b, b,b);  
nor NOR2 (not_a, a,a);  nor NOR3 (and1, not_b,a);
nor NOR4 (and2, not_a, b);
nor NOR5 (s, and1, and2);

endmodule 

module f5b (output s,
input a,
input b);
assign s = a ^ b;

endmodule

module guia_0505;
reg x, y;
wire a, b;
f5a moduleA(a, x, y);
f5b moduleB(b, x, y);

initial 
begin: main
$display("05");
$display(" x  y  a  b");
$monitor("%4b %4b %4b %4b", x,y,a,b);

x = 1'b0; y = 1'b0;
#1 x = 1'b0; y = 1'b1;
#1 x = 1'b1; y = 1'b0;
#1 x = 1'b1; y = 1'b1;

end 
endmodule