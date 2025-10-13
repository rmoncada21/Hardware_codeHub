module main;
    task write_mem();
        $display("Antes de la escritura de memoria");
        #5;
        $display("Escritura completa de memoria");
    endtask

    task read_mem();
        $display("Antes de la lectura de memoria");
        #5;
        $display("Lectura completa de memoria");
    endtask

    initial begin;
        fork
            write_mem();
            read_mem();
        join
    end
endmodule

/*Salida del programa:

Antes de la escritura de memoria
Antes de la lectura de memoria
Escritura completa de memoria
Lectura completa de memoria
*/

// Como puede ver, antes de que la tarea write_mem se complete, 
// la tarea read_mem ya se ha iniciado