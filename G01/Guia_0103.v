//866307 06/02/2025 Rafael Sampaio
module Guia_0103;

 //definir dados
 integer x= 13; //decimal
 reg [7:0] b = 0; //binary (bits - little endian)

 //actions
initial
begin : main
    $display("Guia_0103-testes");
    $display("x = %d", x);
    $display("b = %8b", b);
    b = x;
    $display("b = %B (2) = %o (8) = %x (16) = %X (16)", b,b,b,b);
end//main

endmodule //FIM GUIA 0103