`include "clock.v"//executar com clock na frequencia 72
module pulse1 (output reg signal, input clock);
    always @ (posedge clock) begin
        signal = 1'b1;
        #4 signal = 1'b0;
        #4 signal = 1'b1;
        #4 signal = 1'b0;
        #4 signal = 1'b1;
        #4 signal = 1'b0;
    end
endmodule
module pulse2 (output reg signal, input clock);
    always @ (posedge clock) begin
        signal = 1'b1;
        #5 signal = 1'b0;
    end
endmodule
module pulse3 (output reg signal, input clock);
    always @ (negedge clock) begin
        signal = 1'b1;
        #15 signal = 1'b0;
        #15 signal = 1'b1;
    end
endmodule
module pulse4 (output reg signal, input clock);
    always @ (negedge clock) begin
        signal = 1'b1;
        #20 signal = 1'b0;
        #20 signal = 1'b1;
        #20 signal = 1'b0;
    end
endmodule
module Guia_09_2;
    wire clock;
    clock clk(clock);
    wire p1, p2, p3, p4;
    pulse1 pls1(p1, clock);
    pulse2 pls2(p2, clock);
    pulse3 pls3(p3, clock);
    pulse4 pls4(p4, clock);
    initial begin
        $dumpfile("Guia_09_03.vcd");
        $dumpvars(1, clock, p1, p2, p3, p4);
        #480 $finish;
    end
endmodule