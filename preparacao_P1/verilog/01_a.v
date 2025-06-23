/** 
Preparacao 01 - A 
Aluna: Izadora Galarza Alves
*/ 

module SoP (output s, input a
,input b
, input c
,input d);

assign s= (~a & ~b & c & ~d) // 2
        | (~a & b & c & ~d) // 6
        | (~a & b & c & d) //7
        | (a & b & ~c & ~d) //12
        | (a & b & c & ~d) //14
        | (a & b & c & d); //15
endmodule

module exe01_a;

reg a,b,c,d;
wire s;

SoP SOP1 (s,a,b,c,d);

initial
begin : start
 
 a= 1'bx; b = 1'bx; c= 1'bx; d=1'bx;
end


initial 
begin: main
// identificacao
$display("Exercicio 1 - A - Izadora Galarza Alves");
$display("Test boolean expression");
// monitoramento
$display("a b c d = s");
$monitor("%2b %2b %2b %2b = %2b", a,b,c,d,s );
// sinalizacao
 #1 a=0; b=0; c=0; d=0;  // m0
  #1 a=0; b=0; c=0; d=1;  // m1
  #1 a=0; b=0; c=1; d=0;  // m2 
  #1 a=0; b=0; c=1; d=1;  // m3
  #1 a=0; b=1; c=0; d=0;  // m4
  #1 a=0; b=1; c=0; d=1;  // m5
  #1 a=0; b=1; c=1; d=0;  // m6
  #1 a=0; b=1; c=1; d=1;  // m7 
  #1 a=1; b=0; c=0; d=0;  // m8
  #1 a=1; b=0; c=0; d=1;  // m9
  #1 a=1; b=0; c=1; d=0;  // m10
  #1 a=1; b=0; c=1; d=1;  // m11
  #1 a=1; b=1; c=0; d=0;  // m12 
  #1 a=1; b=1; c=0; d=1;  // m13
  #1 a=1; b=1; c=1; d=0;  // m14 
  #1 a=1; b=1; c=1; d=1;  // m15 
end
endmodule