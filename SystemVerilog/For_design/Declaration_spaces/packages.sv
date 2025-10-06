`ifndef DEFINITIONS_PCK
    `define DEFINITIONS_PCK
        package definitions; 
            parameter VERSION = "1.1";
            typedef enum int {ADD, SUB, MUL} opcodes_t;

            typedef struct {
                logic [31:0] a, b;
                opcodes_t opcode;
            } instruction_t;

            function automatic [31:0] multiplier (input [31:0] a, b);
                return a*b;
            endfunction
        endpackage
        
        import definitions::*;

`endif