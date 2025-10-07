`define FETCH 3'h0
`define WRITE 3'h1
`define ADD   3'h2
`define SUB   3'h3
`define MULT  3'h4
`define DIV   3'h5
`define SHIFT 3'h6
`define NOP   3'h7

module controller(
    input wire [2:0] instruction,
    input wire clock, resetN,
    output reg read, write 
);
    parameter WAITE = 0,
              LOAD = 1,
              STORE = 2;

    reg [1:0] State, NextState;


    always @(posedge clock, negedge resetN)
        if (!resetN) State <= WAITE;
        else State <= NextState;

    always @(State) begin
            case (State)
                WAITE: NextState = LOAD;
                LOAD:  NextState = STORE;
                STORE: NextState = WAITE;
            endcase
        end

    always @(State, instruction) begin
            read = 0; write = 0;
            if (State == LOAD && instruction == `FETCH)
                read <= 1;
            else
                write <= 1;
        end
endmodule