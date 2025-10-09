module testbench_queue;
    string instruction[$] = {"FECTH", "DECODE", "EXCEUTE", "MEM_ACCESS", "WRITE_BACK"};

    initial begin: main
        // seleccionar un subset de la cola
        $display("Subset: %p", instruction[1:2]);

        // obtener elementos desde el indice 1 hasta el final
        $display("Subset: %p", instruction[2:$]);

        //Añadir un elemento al final
        instruction[$+1] = "RETURN";
        $display("NEW - QUEUE: %p", instruction);

        // eliminar el primer elemento de la cola
        instruction = instruction[1:$];
        $display("NEW2 - QUEUE: %p", instruction);
    end
endmodule