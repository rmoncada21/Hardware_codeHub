module main;
    semaphore sema = new(3);

    initial begin
        fork
            procesoA;
            procesoB;
            procesoC;
        join
    end

    task procesoA;
        sema.get(3);
        $display("[procesoA] iniciado");
        #5;
        $display("[procesoA] terminado");
        sema.put(5); // devuelve mas llaves de las inicializadas
    endtask

    task procesoB;
        sema.get(5);
        $display("[procesoB] iniciado");
        #5;
        $display("[procesoB] terminado");
        sema.put(6);
    endtask

    task procesoC;
        sema.get(6);
        $display("[procesoC] iniciado");
        #5;
        $display("[procesoC] terminado");
        sema.put(5);
    endtask
endmodule

/* Salida del programa
[procesoA] iniciado
[procesoA] terminado
[procesoB] iniciado
[procesoB] terminado
*/

/* Salida delvolviendo mas llaves en el procesoB
[procesoA] iniciado
[procesoA] terminado
[procesoB] iniciado
[procesoB] terminado
[procesoC] iniciado
[procesoC] terminado
*/