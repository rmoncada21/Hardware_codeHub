/*
Se activa un evento al mismo tiempo que se espera el activador del evento:

Dado que ambos procesos se activan simultáneamente, el operador @ no 
detectará la activación de un evento (se genera condición de carrera). 
SystemVerilog proporciona una construcción wait() para resolver este problema.
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
        @e1; // mientras tanto, bloque el siguiente display
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

/*
@0: Antes de activar [event e1]
@0: Después de activar [event e1]
test at: @0
@0: Esperando al [evento e1]
*/