/*
Se activa un evento al mismo tiempo que se espera el activador del evento:

Los procesos_A y_B no tienen demoras involucradas para garantizar que la 
activación de un evento y la espera de activaciones iguales ocurran al mismo 
tiempo y la construcción wait() detectará la activación de un evento.
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
@0: Esperando al [evento e1]
*/

/* Salida con wait
@0: Antes de activar [event e1]
@0: Después de activar [event e1]
test at: @0
@0: Esperando al [evento e1]
@0: Evento [event e1] ha sido activado
[fork join] finished at time: 0
*/