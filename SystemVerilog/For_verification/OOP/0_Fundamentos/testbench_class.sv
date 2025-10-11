class transaction;
    bit [31:0] data;
    int id;

    // constructor con parametros
    function new(bit [31:0] data);
        this.data = data;
    endfunction

endclass: transaction

module testbench;
    transaction tr;

    initial begin: main
        transaction tr2 = new(20); // puntero

        tr = new(32'h64);
        $display("tr.data: %0h", tr.data);
        $display("tr2.data: %0h", tr2.data);
    end
endmodule