`ifndef PACKAGES_FSM
    `define PACKAGES_FSM
    package packages_fsm;
        typedef enum logic [2:0] {FETCH, WRITE, ADD, SUB, MULT, DIV,
                    SHIFT, NOP} inst_t;
    endpackage

    import packages_fsm::*;
`endif