`ifndef PACKAGES_ARRAYS
    `define PACKAGES_ARRAYS
        
        package packages_arrays;

            // para arreglos estaticos
            function void display_arreglo(string str, int arreglo[]);
                $display(str);
                foreach(arreglo[i])
                    $display("arreglo[%0d]=%0d",i, arreglo[i]);
            endfunction

            // para arreglos dinamicos
            function void display_arreglo_ref(string str, const ref int arreglo[]);
                $display(str);
                foreach(arreglo[i])
                    $display("arreglo[%0d]=%0d",i, arreglo[i]);
            endfunction

            // arreglos dos dimensiones matrices 
            function void display_matriz(string str, int matriz[2][3]);
                $display(str);
                foreach(matriz[i,j])
                    $display("matriz[%0d][%0d]=%0d",i, j, matriz[i][j]);
            endfunction

            function void display_matriz_ref(string str, const ref int matriz[][]);
                $display(str);
                foreach(matriz[i,j])
                    $display("matriz[%0d][%0d]=%0d",i, j, matriz[i][j]);
            endfunction
        endpackage

        import packages_arrays::*;
`endif