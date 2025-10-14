module mailbox_dinamico;
    mailbox mbx = new();

    task processA;
        int value;
        repeat(10) begin
            value = $urandom_range(1, 50);
            mbx.put(value);
            $display("Put data = %0d", value);
        end
        $display("----------------------");
    endtask

    task processB;
        int value;
        repeat(10) begin
            mbx.get(value);
            $display("Retrieved data = %0d", value);
        end
    endtask

    initial begin: main
        fork
            processA;
            processB;
        join
    end
endmodule