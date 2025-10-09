module tesbench_dynamic_array;
    int arreglo []; // arreglo dinámico

    initial begin: main
        arreglo = new[4]; // se reserva memoria en el heap
        arreglo = '{2, 4, 6, 8};

        // imprimir datos del arreglo
        foreach(arreglo[i]) $display("arreglo[%0d]=%0d", i, arreglo[i]);

        // mostrar el size del arreglo
        $display("size of arreglo = %0d", arreglo.size());
        
        // reasignar tamaño al arreglo
        arreglo = new[6];
        $display("size del arreglo después del resize = %0d", arreglo.size());
        foreach(arreglo[i]) $display("arreglo[%0d]=%0d", i, arreglo[i]);

        arreglo.delete();
        $display("size del arreglo después del resize = %0d", arreglo.size());
    end
endmodule
