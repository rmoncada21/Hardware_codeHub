module SIMPLE(
    input logic clock
);
    integer i;

    always @(posedge clock) begin: loop
        integer i;
        
        for(i=0; i<=100; i=i+1) begin
        end
        i = loop.i;
    end
endmodule