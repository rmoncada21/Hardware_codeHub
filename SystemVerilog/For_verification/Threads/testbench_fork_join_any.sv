/*
    En fork-join_any, todos los procesos se inician simultáneamente 
    y la unión esperará a que se completen uno los procesos para 
    seguir con el programa.
*/

module main;
    initial begin
        fork: threads_any
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
        join_any: threads_any
        $display("fork-join completo tiempo:%0t", $time);
    end
endmodule

/* Salida del programa
[Process A]: inicio:0
[Process B]: inicio:0
[Process C]: inicio:0
[Process A]: fin:10
fork-join completo tiempo:10
[Process B]: fin:20
[Process C]: fin:30
*/