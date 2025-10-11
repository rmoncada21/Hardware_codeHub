module tb;
    int arreglo[];
    int size = 10;
    int cola[$];
    
    // pasar el puntero con ref
    function llenar_arreglo (ref int local_arreglo[], int size);
        local_arreglo = new [size];
        foreach(local_arreglo[i])
            local_arreglo[i] = $urandom_range(0, 100);
    endfunction

    function void mostrar_arreglo(int arreglo[]);
        foreach(arreglo[i]) 
            $display("arreglo[%0d]: %0d", i, arreglo[i]);
    endfunction

    initial begin: main
        // llenar_arreglo(arreglo);
        llenar_arreglo(arreglo, size);
        mostrar_arreglo(arreglo);
        $display("Arreglo: %p", arreglo);

        // métodos de localización
        // find
        cola = arreglo.find(x) with(x>=50);
        $display("Resultados find de x>=50: %p", cola);

        // find_index
        cola = arreglo.find_index with (item >=50);
        $display("Resultados find_index item == 30: %p", cola);

        // find_first_index
        cola = arreglo.find_first_index with (item%2==0 && item!=0);
        $display("Resultados find_first_index item%%2==0 && item!=0: %p", cola);

        arreglo.delete();
        cola.delete();
    end
endmodule