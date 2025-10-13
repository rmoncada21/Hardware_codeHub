/* event my_event

-> Se utiliza para activar un evento que desbloquea todos los 
procesos en espera debido a este evento. Es un evento instantáneo .

->> Este operador se utiliza para activar eventos no bloqueantes .

@my_event: El operador @ se utiliza para bloquear el proceso hasta que se 
active un evento. Este operador es sensible a los bordes. 
Por lo tanto, la espera de un evento debe ejecutarse antes de 
activarlo para evitar bloquear el proceso en espera. 

wait(my_event.triggered):  La construcción wait() es similar al operador @ excepto que 
desbloqueará el proceso incluso si se activa un evento y se espera 
que ocurra un evento al mismo tiempo.
*/

/*
Se activa un evento después de esperar el activador del evento:

La tarea process_A tiene un retardo de 10 ns que garantiza que 
el evento e1 se active tras esperar a que se active el evento.
*/
module main;
    event e1;

    task processA();
        #10;
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
@0: Esperando al [evento e1]
@10: Antes de activar [event e1]
@10: Después de activar [event e1]
test at: @10
@10: Evento [event e1] ha sido activado
[fork join] finished at time: 10
*/