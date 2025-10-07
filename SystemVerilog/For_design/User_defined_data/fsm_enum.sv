`include "packages_fsm.sv"


module controller(
    input inst_t instruction,
    input logic clock, resetN,
    output logic read, write
);
    enum logic {LOAD, STORE, WAITE} State, NextState;

    always_ff @(posedge clock, negedge resetN) begin
        if (!resetN) State <= WAITE;
        else State <= NextState;
    end

    always_comb begin
        case (State)
        WAITE: NextState = LOAD;
        LOAD: NextState = STORE;
        STORE: NextState = WAITE;
        endcase
    end

    always_comb begin
        read = 0; write = 0;
        if (State == LOAD && instruction == FETCH)
            read = 1;
        else if (State == STORE && instruction == WRITE)
            write = 1;
    end

endmodule