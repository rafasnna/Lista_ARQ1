module fxy (output s1, s2, input x, y);
assign s1 = (y & ~x) & ~(~y | x);
assign s2 = y & ~x;
endmodule 

module guia0402e;
reg x, y;
wire s1, s2;

fxy FXY (s1, s2, x, y);

initial 
begin: start
    x = 1'bx; y = 1'bx; 
end

initial 
begin: main
    $display("Exercicio 0402");
    $display("Questao E");
    $display(" ( y + x' ) . ( y' + x )' = s1  s2 ");
    $display(" x  y  =  s1 s2 ");
    $monitor(" %b  %b  =  %b %b ", x, y, s1, s2);

    #1 x = 0; y = 0;  
    #1 x = 0; y = 1;  
    #1 x = 1; y = 0; 
    #1 x = 1; y = 1; 
end
endmodule