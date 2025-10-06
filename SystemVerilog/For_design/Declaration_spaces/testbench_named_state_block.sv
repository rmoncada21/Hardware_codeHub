`include "named_state_block.sv"

module test;
    logic clock;

    // instanciar el DUT
    SIMPLE simple(.clock(clock));

    always #5 clock = ~clock;

    // Iniciar el test
    initial begin: main
        // iniciar el clock
        clock = 0;

        repeat(5) @(negedge clock);
        #10;
        $display("simple.i = %0d", simple.i);
        $display("simple.loop.i = %0d", simple.loop.i);
        $finish;
    end
endmodule