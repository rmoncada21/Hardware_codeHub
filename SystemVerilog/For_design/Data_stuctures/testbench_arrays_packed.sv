`include "packages_arrays_packed.sv"

module arrays_packed;
    logic [7:0] packed_arreglo;
    logic [2:0][3:0] packed_arregloB;

    typedef logic [31:0] int32_t;
    int32_t arreglo[3:0];
    int32_t [3:0] arregloB;


    initial begin: main_packed
        packed_arregloB = '{4'h0, 4'h2, 4'h5};
        arreglo = '{32'd25, 32'd2, 32'd5, 32'd0};
        arregloB = '{32'd25, 32'd2, 32'd5, 32'd0};
        display_arreglo_packed("packed_arregloB", packed_arregloB);

        foreach(arreglo[i]) begin
            $display("Elemento %0d = %0b", i, arreglo[i]);
        end

        foreach(arregloB[i]) begin
            $display("Elemento %0d = %0b", i, arregloB[i]);
        end
    end
endmodule