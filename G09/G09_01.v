module clock (output clk);
    reg clk;
    initial begin
        clk = 1'b0;
    end
    always begin
        #12 clk = ~clk;
    end
endmodule
// ---------------------------
// -- pulse generator
// ---------------------------
module pulse (output reg signal, input clock);
    always @ (clock) begin
        signal = 1'b1;
        #3 signal = 1'b0;
        #3 signal = 1'b1;
        #3 signal = 1'b0;
    end
endmodule // pulse
// ---------------------------
// -- trigger when ON and clock
// ---------------------------
module trigger (output reg signal, input on, input clock);
    always @ (posedge clock) begin
        if (on) begin
            #60 signal = 1'b1;
            #60 signal = 1'b0;
        end
    end
endmodule // trigger
// ---------------------------
// -- main test module
// ---------------------------
module Guia_0901;
    wire clock;
    clock clk(clock); // instancia o clock

    reg p;
    wire p1, t1;

    pulse pulse1(p1, clock);           // instancia o gerador de pulso
    trigger trigger1(t1, p, clock);    // instancia o trigger

    initial begin
        p = 1'b0;
    end

    initial begin
        $dumpfile("Guia_09_01.vcd");
        $dumpvars(1, clock, p1, p, t1);
        #60  p = 1'b1;
        #60  p = 1'b0;
        #60  p = 1'b1;
        #60  p = 1'b0;
        #60  p = 1'b1;
        #60  p = 1'b0;
        #16  $finish;
    end
endmodule // Guia_0901
