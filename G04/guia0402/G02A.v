module fxy (output s, input x, y);
assign s = ~x & ~y;
endmodule 

module guia0402a;
reg x, y;
wire s;

fxy FXY (s, x, y);

initial 
begin: start
    x = 1'bx; y = 1'bx; 
end

initial 
begin: main
    $display("Exercicio 0402");
    $display("Questao A");
    $display(" ( x' + y' ) . ( y + z')' = s ");
    $display(" x  y  =  s ");
    $monitor(" %b  %b  =  %b ", x, y, s);

    #1 x = 0; y = 0;  
    #1 x = 0; y = 1;  
    #1 x = 1; y = 0; 
    #1 x = 1; y = 1; 
end
endmodule