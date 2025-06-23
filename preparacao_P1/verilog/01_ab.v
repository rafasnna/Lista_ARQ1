/** 
Preparacao 01 - a e b 
Aluna: Izadora Galarza Alves
*/ 

// ---------------------
// -- SoP (Soma de Produtos)
// ---------------------
module SoP (output s1, 
input a, 
input b,
input c, 
input d);

assign s1 = (~a & ~b & c & ~d)   // 2
          | (~a & b & c & ~d)    // 6
          | (~a & b & c & d)     // 7
          | (a & b & ~c & ~d)    // 12
          | (a & b & c & ~d)     // 14
          | (a & b & c & d);     // 15

endmodule


module PoS (output s2, 
input a, 
input b, 
input c, 
input d);

assign s2 = (a|b|c|d)      // 0
          & (a|b|c|~d)     // 1
          & (a|b|~c|~d)    // 3
          & (a|~b|c|d)     // 4
          & (a|~b|c|~d)    // 5
          & (~a|b|c|d)     // 8
          & (~a|b|c|~d)    // 9
          & (~a|b|c|~d)    // 10 
          & (~a|b|~c|~d)   // 11
          & (~a|~b|c|~d);  // 13

endmodule

// ---------------------
// -- Testbench
// ---------------------
module exe01_ab;

reg a, b, c, d;
wire s1, s2;

SoP SOP1 (s1, a, b, c, d);
PoS POS1 (s2, a, b, c, d);

initial begin : start
  a = 1'bx; b = 1'bx; c = 1'bx; d = 1'bx;
end

initial begin : main
  // identificação
  $display("Exercicio 1 - A e B - Izadora Galarza Alves");
  $display("Test boolean expressions (SoP e PoS)");
  $display("a b c d = s1 s2");
  $monitor("%2b %2b %2b %2b = %2b %2b", a, b, c, d, s1, s2);

  // todas as combinações (m0 até m15)
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
