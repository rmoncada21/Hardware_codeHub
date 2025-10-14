/* Siempre leen los primeros datos/(dato top)
peek	    Sí	Lee el primer dato sin eliminarlo; bloquea si está vacío
try_peek	No	Intenta leer el primer dato sin eliminarlo; 
            retorna 0 si está vacío
*/

module mailbox_peek;
    mailbox mbx = new();

    task processA;
        int value;
        repeat(3) begin
            value = $urandom_range(2, 100);
            mbx.put(value);
            $display("put data = %0d", value);
        end
        $display("----------------------------------");
    endtask
    
    task processB;
        int value;
        mbx.peek(value); // message is not removed
        $display("peek data = %0d", value);
        mbx.peek(value); // message is not removed
        $display("peek data = %0d", value);
        
        if(mbx.try_peek(value))
            $display("Successful try_peek data = %0d", value);
        else begin
            $display("Failed in try_peek");
        end
        
        // get datos
        $display("----------------------------------");
        repeat(3) begin
            mbx.get(value);
            $display("get data = %0d", value);
        end
        
        
        $display("----------------------------------");
        if(mbx.try_peek(value))
            $display("Successful try_peek data = %0d", value);
        else begin
            $display("Failed in try_peek");
        end
    endtask
  
    initial begin
        fork
            processA();
            processB();
        join
    end
endmodule

/* Salida del programa
put data = 31
put data = 30
put data = 18
----------------------------------
peek data = 31
peek data = 31
Successful try_peek data = 31
----------------------------------
get data = 31
get data = 30
get data = 18
----------------------------------
Failed in try_peek

*/