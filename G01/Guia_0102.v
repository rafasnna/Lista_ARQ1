//866307 06/02/2025 Rafael Sampaio
module Guia_0102;

 //definir dados
 integer x= 0; //decimal
 reg [7:0] b = 8'b0001101; //binary (bits - little endian)

 //actions
initial
begin : main
    $display("Guia_0102-testes");
    $display("x = %d", x);
    $display("b = %8b", b);
    x = b;
    $display("b = %d", x);
end//main

endmodule //FIM GUIA 0102