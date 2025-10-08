`include "packages.sv" // tener cuidado con el orden las importaciones
`include "alu.sv"
`include "alu_unit_space.sv"
// import definitions::*;

`define SHOW_MACRO(name) initial $display("Instanciando %s", name);
// `define ALU_SPECIFIC
`define ALU_WILDCARD
// `define ALU_UNIT

module tb;
    // entradas y salidas
    instruction_t inst;
    logic clock;
    logic [31:0] result, score;

    // instanciar DUT
    `ifdef ALU_SPECIFIC
        // initial $display("ALU_SPECIFIC MACRO");
        `SHOW_MACRO("ALU_SPECIFIC MACRO")
        ALU_specific_item alu(
            .IW(inst),
            .clock(clock),
            .result(result) );
    
    `elsif ALU_WILDCARD
        `SHOW_MACRO("ALU_WILDCARD MACRO")
        ALU_wildcard alu(
            .IW(inst),
            .clock(clock),
            .result(result) );
    
    `elsif ALU_UNI_SPACE
        `SHOW_MACRO("ALU_UNIT MACRO")
        ALU_unit_space alu(
            .IW(inst),
            .clock(clock),
            .result(result) );
    
    `else
        `SHOW_MACRO("ALU_explicit MACRO")
        ALU_explicit alu(
            .IW(inst),
            .clock(clock),
            .result(result) );
    `endif

    // generar el reloj
    always #10 clock = ~clock;
    
    task gen_vcd_file;
        $dumpfile("gtkwave/tb.vcd");
        $dumpvars(0, tb);
    endtask
    
    // inicializar variables y test
    initial begin: main
        gen_vcd_file;
        $display("TEST simple alu & packages");
        $monitor("Tiemp=%0t Clk=%0b inst.a=%0d inst.b=%0d result=%0d \
            score=%0d", $time, clock, inst.a, inst.b, result, score);
        clock = 0; 
        // result = 32'd0;
        inst.a = 32'd0;
        inst.b = 32'd0;
        #5;
        // ADD
        inst.opcode = ADD;
        inst.a = 32'd10;
        inst.b = 32'd15; 
        score = inst.a + inst.b;
        #20;

        // SUB
        inst.opcode = SUB;
        inst.a = 32'd20;
        inst.b = 32'd5; 
        score = inst.a + inst.b;
        #20;

        // MUL
        $finish;
    end
endmodule