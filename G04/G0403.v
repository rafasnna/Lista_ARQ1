
module SoP (output s, input x, y, z); 
assign s = (~x & ~y & z) | (~x & y & ~z) | (x & y & ~z) | (x & y & z);
endmodule

module guia0403;
reg x, y,z;
wire s;

SoP FXY (s, x, y, z);

initial 
begin: start
x=0; y=0; z=0; 
end

initial 
begin: main

$display("EX0403");
$display("A)");
$display("\n  \n");
 $display("x  y  z =  s");
        $monitor("%2b %2b %2b =  %2b", x, y, z, s);

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