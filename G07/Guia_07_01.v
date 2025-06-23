module f7a (output s, input x, input y);
  and AND0 (s, x, y);
endmodule

module f7b (output s, input x, input y);
  nand NAND0 (s, x, y);
endmodule

module mux (output s, input a, input b, input select);
  wire not_select;
  wire n1;
  wire n2;

  nand NAND2 (not_select, select, select); // NOT
  nand NAND3 (n1, not_select, a);          // n1 = ~select & a
  nand NAND4 (n2, select, b);              // n2 = select & b
  nand NAND5 (s, n1, n2);                  // s = n1 | n2 (com lógica NANDs)
endmodule

module Guia_07_01;
  reg x;
  reg y;
  reg select;
  wire a;
  wire b;
  wire c;

  f7a moduleA(a, x, y);
  f7b moduleB(b, x, y);
  mux moduleC(c, a, b, select);

  initial begin: main
    $display("Guia_07_01 - Tests");
    $display("|   x     y   |   a     b     | select  |   s  |");
    $monitor("|%4b  %4b   |%4b  %4b     |%4b     |%4b  |", x, y, a, b, select, c);
 
       x = 1'b0; y = 1'b0; select = 1'b1; #1 select = 1'b0;
    #1 x = 1'b0; y = 1'b1; select = 1'b1; #1 select = 1'b0;
    #1 x = 1'b1; y = 1'b0; select = 1'b1; #1 select = 1'b0;
    #1 x = 1'b1; y = 1'b1; select = 1'b1; #1 select = 1'b0;
  end
endmodule