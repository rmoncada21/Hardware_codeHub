module testbench_sort_methods;
    int arreglo [];
    int size = 10;
    int cola[$];

    function void llenar_arreglo(ref int arreglo[], int size);
        arreglo = new[size];
        foreach(arreglo[i]) arreglo[i] = $urandom_range(0, 100);
    endfunction

    function void mostrar_arreglo(int arreglo[]);
        foreach(arreglo[i]) $display("arreglo[%0d]=%0d", i, arreglo[i]);
    endfunction

    initial begin: main
        llenar_arreglo(arreglo, size);
        mostrar_arreglo(arreglo);
        $display("Arreglo: %p", arreglo);

        // métodos de ordenamiento
        arreglo.sort(); // function sort de tipo void 
        $display("Arreglo sort: %p", arreglo);

        arreglo.rsort();
        $display("Arreglo rsort: %p", arreglo);

        arreglo.shuffle();
        $display("Arreglo shuffle: %p", arreglo);

        arreglo.reverse();
        $display("Arreglo reverse: %p", arreglo);
    end
endmodule