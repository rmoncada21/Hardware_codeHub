`ifndef PACKAGES_ARRAYS_PACKED
    `define PACKAGES_ARRAYS_PACKED
        package packages_arrays_packed;
            function void display_arreglo_packed (
                string str, logic [2:0][3:0] packed_arreglo);
                $display(str);
                foreach(packed_arreglo[i])
                    $display("packed_arreglo[%0d]=%0d",i, packed_arreglo[i]);
            endfunction

        endpackage
        import packages_arrays_packed::*;
`endif