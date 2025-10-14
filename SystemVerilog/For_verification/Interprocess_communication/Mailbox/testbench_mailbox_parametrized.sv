module mailbox_parametrizado;
    mailbox #(string) mbx = new(3); // mailbox generico

    task processA;
        string code_name = "CODE_DEAD";
        mbx.put(code_name);
        $display("Put code_name = %s", code_name);
        code_name = "CODE_AAAA";
        mbx.put(code_name);
        $display("Put code_name = %s", code_name);
    endtask

    task processB;
        string code_name;
        mbx.get(code_name);
        $display("Get code_name = %s", code_name);
        mbx.get(code_name);
        $display("Get code_name = %s", code_name);
    endtask

    initial begin: main
        fork
            processA;
            processB;
        join
    end
endmodule

/* Salida del programa
Put code_name = CODE_DEAD
Put code_name = CODE_AAAA
Get code_name = CODE_DEAD
Get code_name = CODE_AAAA
*/