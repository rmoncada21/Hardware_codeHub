/*
Un evento se activa después de esperar el disparador del evento.
*/
module main;
    event e1;

    task processA();
        $display("@%0t: Antes de activar [event e1]", $time);
        ->e1; // active el evento
        $display("@%0t: Después de activar [event e1]", $time);
        $display("test at: @%0t", $time);
    endtask

    task processB();
        #10;
        $display("@%0t: Esperando al [evento e1]", $time);
        // se espera por el evento e1
        // @e1; // mientras tanto, bloque el siguiente display
        wait(e1.triggered);
        $display("@%0t: Evento [event e1] ha sido activado", $time);
    endtask

    initial begin
        fork
            processA();
            processB();
        join
        $display("[fork join] finished at time: %0t", $time);
    end
endmodule

/* Salida sin wait
@0: Antes de activar [event e1]
@0: Después de activar [event e1]
test at: @0
@10: Esperando al [evento e1]
*/

/* Salida despues del wait
@0: Antes de activar [event e1]
@0: Después de activar [event e1]
test at: @0
@10: Esperando al [evento e1]
*/