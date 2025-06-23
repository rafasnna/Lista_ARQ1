// clock.v
module clock (output reg clk);
    initial clk = 0;
    always #12 clk = ~clk;
endmodule
