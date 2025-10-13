/*
try_get() es un método de semáforo no bloqueante cuya ejecución 
no se bloquea si no hay claves disponibles. 
En el siguiente ejemplo, 
el proceso_A obtuvo una clave inicialmente, e incluso si no hay 
clave disponible, la ejecución del proceso_B no se bloquea.
*/
module main;
    semaphore mutex = new(1);

    task processA;
        if(mutex.try_get()) $display("[processA]: llave recibida");
        else $display("[processA]: llave no disponible");

        $display("[processA]: inicio");
        #5
        $display("[processA]: fin");
        mutex.put();
    endtask

    task processB;
        if(mutex.try_get()) $display("[processB]: llave recibida");
        else $display("[processB]: llave no disponible");

        $display("[processB]: inicio");
        #4
        $display("[processB]: fin");
        mutex.put();
    endtask

    initial begin
        fork 
            processA;
            processB;
        join
    end
endmodule

/*Salida del programa

*/