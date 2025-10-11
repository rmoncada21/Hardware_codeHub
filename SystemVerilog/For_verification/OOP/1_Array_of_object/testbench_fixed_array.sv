class Transaction;
    bit [31:0] data;
    int id;
endclass

module tb;
    Transaction tr[5];

    initial begin: main
        foreach(tr[i]) begin
            tr[i] = new;
            tr[i].data = i*i;
            tr[i].id = i;
        end

        $display("tr[]: %p", tr);
        foreach(tr[i]) $display("tr[%0d]: %p", i, tr[i]);
    end
endmodule