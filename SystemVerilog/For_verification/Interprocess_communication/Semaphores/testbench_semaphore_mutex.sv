module main;
    semaphore sema;

    task write_mem();
        sema.get(1);
        $display("Antes de la escritura de memoria");
        #5;
        $display("Escritura completa de memoria");
        sema.put(1);
    endtask

    task read_mem();
        sema.get(1);
        $display("Antes de la lectura de memoria");
        #5;
        $display("Lectura completa de memoria");
        sema.put(1);
    endtask

    initial begin;
        sema = new(1);
        fork
            write_mem();
            read_mem();
        join
    end
endmodule

/* Salida del programa

Antes de la escritura de memoria
Escritura completa de memoria
Antes de la lectura de memoria
Lectura completa de memoria
*/