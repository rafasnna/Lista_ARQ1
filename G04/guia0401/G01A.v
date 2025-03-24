module fxyz (output s, input x, y, z);
assign s = ~x & ~(y | ~z);
endmodule 

module guia0401;
reg x, y, z;
wire s;

fxyz FXYZ (s, x, y, z);

initial 
begin: start
    x = 1'bx; y = 1'bx; z = 1'bx; 
end

initial 
begin: main
    $display("Exercicio 0401");
    $display("Questao A");
    $display(" x' . ( y + z' )' = s ");
    $display(" x  y  z  =  s ");
    $monitor(" %b  %b  %b  =  %b ", x, y, z, s);

    #1 x = 0; y = 0; z = 0; 
    #1 x = 0; y = 0; z = 1; 
    #1 x = 0; y = 1; z = 0; 
    #1 x = 0; y = 1; z = 1; 
    #1 x = 1; y = 0; z = 0; 
    #1 x = 1; y = 0; z = 1; 
    #1 x = 1; y = 1; z = 0; 
    #1 x = 1; y = 1; z = 1; 
end
endmodule