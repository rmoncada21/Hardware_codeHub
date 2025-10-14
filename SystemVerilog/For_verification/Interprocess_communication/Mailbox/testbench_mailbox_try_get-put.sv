/*
try_get: El método no bloqueante que devuelve/toma datos si un buzón no 
está vacío; de lo contrario, devuelve 0.

try_put: El método no bloqueante que almacena/pone datos en el buzón si no 
está lleno y devuelve 1, de lo contrario devuelve 0.
*/


module mailbox;
    mailbox mbx = new();
    
    task processA;
        int value;
        repeat(5) begin: ciclo
            value = $urandom_range(0, 100);

            if(mbx.try_put(value)) 
                $display("successfully try_put data = %0d", value);

            else begin
                $display("failed while try_put data = %0d", value);
                $display("Number of messages in the mailbox = %0d", mbx.num());
            end
        end: ciclo
        $display("----------------------------");
    endtask

    task processB;
        int value;
        
        repeat(5) begin
            if(mbx.try_get(value))
                $display("Successfully retrieved try_get data = %0d", value);    
            else begin
                $display("Failed in try_get data");
                $display("Number of messages in the mailbox = %0d", mbx.num());
            end
        end

    endtask
    initial begin: main
        fork
            processA;
            processB;
        join
    end
endmodule

/* Salida del programa
successfully try_put data = 98
successfully try_put data = 74
successfully try_put data = 76
failed while try_put data = 71
Number of messages in the mailbox = 3
failed while try_put data = 5
Number of messages in the mailbox = 3
----------------------------
Successfully retrieved try_get data = 98
Successfully retrieved try_get data = 74
Successfully retrieved try_get data = 76
Failed in try_get data
Number of messages in the mailbox = 0
Failed in try_get data
Number of messages in the mailbox = 0
*/