//866307 06/02/2025 Rafael Sampaio
module Guia_0104;

 //definir dados
 integer x= 13; //decimal
 reg [7:0] b = 0; //binary (bits - little endian)

 //actions
initial
begin : main
    $display("Guia_0104-testes");
    $display("x = %d", x);
    $display("b = %8b", b);
    b = x;
    $display("b = [%4b] [%4b] = %x %x",b[7:4], b[3:0], b[7:4], b[3:0]);//agrupamento
end//main

endmodule //FIM GUIA 0104