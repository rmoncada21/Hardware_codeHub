module mailbox_generico;
    mailbox mbx = new(3); // mailbox generico

    task processA;
        int value = 5;
        string name = "name-processA";
        mbx.put(value);
        $display("Put value = %0d", value);
        mbx.put(name);
        $display("Put name = %s", name);
    endtask

    task processB;
        int value;
        string name;
        mbx.get(value);
        $display("Get value = %0d", value);
        mbx.get(name);
        $display("Get name = %s", name);
    endtask

    initial begin: main
        fork
            processA;
            processB;
        join

    end
endmodule

/* Salida del programa
Put value = 5
Put name = name-processA
Get value = 5
Get name = name-processA
*/