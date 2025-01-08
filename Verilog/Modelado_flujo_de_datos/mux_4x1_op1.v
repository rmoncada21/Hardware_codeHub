module test_mux4x1(
    output out,
    input i0, i1, i2, i3,
    input s1, s0
);

    assign out = (~s1 & ~s0 & i0) | 
                 (~s1 & s0 & i1)  | 
                 (s1 & ~s0 & i2)  | 
                 (s1 & s0 & i3);
endmodule