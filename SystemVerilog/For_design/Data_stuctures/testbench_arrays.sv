`include "packages_arrays.sv"

module arrays;
    // arreglos unidimensionales
    int arreglo_estatico[3]; // arreglo estático unpacked
    int arreglo_estaticoB[2:0] = '{0, 1, 7};
    int arreglo_estatico2[] = '{0, 1, 2};

    // matrices
    int matriz [2][3] = '{'{1,2,3}, '{4,5,6}};
    int matrizB [][] = '{'{1,2,3}, '{4,5,6}};

    initial begin: main
        $display("TEST");
        display_arreglo("arreglo_estatico", arreglo_estatico);
        display_arreglo("arreglo_estaticoB", arreglo_estaticoB);
        display_arreglo_ref("arreglo_estatico2", arreglo_estatico2);

        display_matriz("matriz",matriz);
        display_matriz_ref("matriz",matrizB);
    end

endmodule