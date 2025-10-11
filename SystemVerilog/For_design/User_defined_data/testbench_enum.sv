`include "packages_enum.sv"

`define SHOW_COLOR(data) $display("Valor: %d, name=%s", data, data.name);

module testbench;
    
    // typedef enum int {RED, GREEN, BLUE} RGB_t;
    // typedef enum int {COVERAGE, CHECKS, FATAL, DEFAULT[2]} FLAGS_ENABLE_T;
    RGB_T rgbA;
    FLAGS_T flags;

    initial begin: testbench_main
        // test RGB_T    
        $display("TEST RGB_T enum");
        rgbA = RED; `SHOW_COLOR(rgbA)
        rgbA = GREEN; `SHOW_COLOR(rgbA)

        // test FLAGS_ENABLE_T
        // FLAGS_ENABLE_T flags;
        $display("TEST FLAGS_ENABLE_T enum");
        flags = COVERAGE; `SHOW_COLOR(flags)
        flags = CHECKS;   `SHOW_COLOR(flags)
        flags = FATAL;   `SHOW_COLOR(flags)
        flags = DEFAULT0; `SHOW_COLOR(flags)
        flags = DEFAULT1; `SHOW_COLOR(flags)
        $finish;
    end
endmodule
