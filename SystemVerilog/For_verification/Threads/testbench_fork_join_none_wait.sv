/*
    - En fork-join_any, todos los procesos se inician simultáneamente 
    y la unión esperará a que se completen uno los procesos para 
    seguir con el programa.

    - Wait fork: espera que todos los procesos terminen
*/

module main;
    initial begin
        fork: threads_non
            begin: ProcesoA
                $display("[Process A]: inicio:%0t", $time);
                #10;
                $display("[Process A]: fin:%0t", $time);
            end

            begin: ProcesoB
                $display("[Process B]: inicio:%0t", $time);
                #20;
                $display("[Process B]: fin:%0t", $time);
            end

            begin: ProcesoC
                $display("[Process C]: inicio:%0t", $time);
                #30;
                $display("[Process C]: fin:%0t", $time);
            end
        join_none: threads_non
        wait fork;
        $display("fork-join completo tiempo:%0t", $time);
    end
endmodule

/* Salida del programa SIN wait fork
fork-join completo tiempo:0
[Process A]: inicio:0
[Process B]: inicio:0
[Process C]: inicio:0
[Process A]: fin:10
[Process B]: fin:20
[Process C]: fin:30
*/

/* Salida del programa CON wait fork
[Process A]: inicio:0
[Process B]: inicio:0
[Process C]: inicio:0
[Process A]: fin:10
[Process B]: fin:20
[Process C]: fin:30
fork-join completo tiempo:30
*/