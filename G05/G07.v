module f5a (output s, 
input a,
input b);

wire a,b, and1, and2;

nor NOR1(and1, a,b);
nor NOR2(and2, and1,and1);
nor NOR3 (s, and2, and2);

endmodule

module f5b (output s,
input a,
input b);

assign s = ~(~a & ~b);

endmodule

module guia_0507;
reg x,y;
wire a,b;

f5a moduleA(a,x,y);
f5b moduleB (b,x,y);

initial 
begin: main
$display("07");
$display(" x  y  a  b");
$monitor("%4b %4b %4b %4b", x,y,a,b);

x = 1'b0; y = 1'b0;
#1 x = 1'b0; y = 1'b1;
#1 x = 1'b1; y = 1'b0;
#1 x = 1'b1; y = 1'b1;

end
endmodule