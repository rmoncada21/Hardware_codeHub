// `include "packages.sv" ya se ingresó a través de packages.sv
// Haciendo referencia explícita del package definitions
// con el operador de resolución ::
module ALU_explicit(
    input definitions::instruction_t IW, 
    input logic clock,
    output logic [31:0] result
);

    always_ff @(posedge clock) begin
        case(IW.opcode)
            definitions::ADD:  result <= IW.a + IW.b;
            definitions::SUB:  result <= IW.a - IW.b;
            definitions::MUL:  result <= definitions::multiplier(IW.a, IW.b);
            default : $display("Caso default");
        endcase
    end
endmodule;

// Haciendo uso de items especificos
module ALU_specific_item(
    input definitions::instruction_t IW,
    input logic clock,
    output logic [31:0] result
);
    import definitions::ADD;
    import definitions::SUB;
    import definitions::MUL;
    import definitions::multiplier;

    always_comb begin
        case(IW.opcode)
            ADD: result = IW.a + IW.b;
            SUB: result = IW.a - IW.b;
            MUL: result = multiplier(IW.a, IW.b);
        endcase
    end
endmodule


module ALU_wildcard(
    input definitions::instruction_t IW,
    input logic clock,
    output logic [31:0] result
);
    import definitions::*;

    always_comb begin
        case(IW.opcode)
            ADD: result = IW.a + IW.b;
            SUB: result = IW.a - IW.b;
            MUL: result = multiplier(IW.a, IW.b);
            // default;
        endcase
    end
endmodule