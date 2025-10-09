module testbench_asociative_arrays;
    typedef enum {FECTH, DECODE, EXECUTE} clave;
    
    // arreglo asociativo con clave del tipo clave
    bit [7:0] arreglo_asociativo_clave [clave];
    // arreglo asociativo con clave del tipo int
    bit [7:0] arreglo_asociativo_int [int];

    initial begin: main
        arreglo_asociativo_clave[FECTH] = 8'hA0;
        arreglo_asociativo_clave[DECODE] = 8'hB0;
        arreglo_asociativo_clave[EXECUTE] = 8'hC0;

        foreach(arreglo_asociativo_clave[i]) begin
            $display("arreglo_asociativo_clave[%s]:%0h", i.name(), arreglo_asociativo_clave[i]);
        end

        arreglo_asociativo_int[0] = 8'hD0;
        arreglo_asociativo_int[1] = 8'hD1;
        arreglo_asociativo_int[2] = 8'hD2;

        foreach(arreglo_asociativo_int[i]) begin
            $display("arreglo_asociativo_int[%0d]:%0h", i, arreglo_asociativo_int[i]);
        end
    end
endmodule