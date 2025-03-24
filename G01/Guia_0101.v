//866307 05/02/2025 Rafael Sampaio
module Guia_0101;

 //definir dados
 integer x= 13; //decimal
 reg [7:0] b = 0; //binary (bits - little endian)

 //actions
initial
begin : main
    $display("Guia_0101-testes");
    $display("x = %d", x);
    $display("b = %8b", b);
    b = x;
    $display("b = %8b", b);
end//main

endmodule //FIM GUIA 0101