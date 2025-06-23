/** 
Preparacao 01 - c 
Aluna: Izadora Galarza Alves
*/

module SoP (output s,
input a, 
input b,
input c,
input d);

assign s = (~a & c & ~d)
          | (b & c)
          | (a & b & ~d);

endmodule 

module exe01_c;

reg a,b,c,d;
wire s;

SoP SOP1 (s,a,b,c,d);

initial 
begin: start

a= 1'bx; b= 1'bx; c= 1'bx; d= 1'bx;
end

initial 
begin: main

$display("Exercicio 1 - c - Izadora Galarza Alves");
$display ("(a' . c. d') + (b . c) + (a . b. d')");
$display( "a   b   c   d   s");
$monitor("%2b %2b %2b %2b = %2b", a,b,c,d,s);

#1 a=0; b=0; c=0; d=0;
#1 a=0; b=0; c=0; d=1;
#1 a=0; b=0; c=1; d=0;
#1 a=0; b=0; c=1; d=1;
#1 a=0; b=1; c=0; d=0;
#1 a=0; b=1; c=0; d=1;
#1 a=0; b=1; c=1; d=0;
#1 a=0; b=1; c=1; d=1;
#1 a=1; b=0; c=0; d=0;
#1 a=1; b=0; c=0; d=1;
#1 a=1; b=0; c=1; d=0;
#1 a=1; b=0; c=1; d=1;
#1 a=1; b=1; c=0; d=0;
#1 a=1; b=1; c=0; d=1;
#1 a=1; b=1; c=1; d=0;
#1 a=1; b=1; c=1; d=1;

end
endmodule