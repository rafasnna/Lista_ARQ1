//866307 06/02/2025 Rafael Sampaio
module Guia_0105;

 //definir dados
 integer x= 13; //decimal
 reg [7:0] b = 0; //binary 
 reg [0:2][7:0] s = "PUC"; //char array [3] (3x8 bits - little endian)

 //actions
initial
begin : main
    $display("Guia_0105-testes");
    $display("x = %d", x);
    $display("b = %8b", b);
    $display("s = %s", s);
    b = x;
    $display("b = [%4b] [%4b] = %h %h",b[7:4], b[3:0], b[7:4], b[3:0]);//agrupamento
    s[0] = "-";
    s[1] = 8'b01001101; //'M'
    s[2] = 71; //'G'
    $display ("s = %s", s);

end//main

endmodule //FIM GUIA 0105