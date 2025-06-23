module f ( output s,
input x,
input y );
wire w1, w2, w3, w4, w5;
not NOT_1 (w1, x);
not NOT_2 (w2, y);
and OR__1 (w3, y, w2);
or OR__2 (w4, w1, x);
not NOT_3 (w5, w4);
and AND_1 (s, w3, w5);
endmodule 

module exe02;

reg x,y;
wire s;

f F1 (s, x, y);

initial begin : start
  x = 1'bx; y = 1'bx;
end

initial 
 begin: main
  // identificação
  $display("Exercicio 2 - Izadora Galarza Alves");
  $display("x y = s");
  $monitor(" %2b %2b = %2b", x,y ,s);

  #1 x=0; y=0;  // m0
  #1 x=0; y=1;  // m1
  #1 x=1; y=0;  // m2
  #1 x=1; y=1;  // m3
  
end

endmodule
