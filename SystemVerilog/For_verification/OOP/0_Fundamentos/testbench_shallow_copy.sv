class Error_trans;
    bit [31:0] error_data;
    bit error;

    extern function new(bit [31:0], bit);
endclass

function Error_trans::new(bit [31:0] error_data, bit error);
    this.error_data = error_data;
    this.error = error;
endfunction

class Transaction;
    bit [31:0] data;
    int id;
    Error_trans err_tr;

    extern function new();
    extern function display();
endclass

function Transaction::new();
    this.data = 100;
    this.id = 1;
    err_tr = new(32'hFFFF_FFFF, 1);
endfunction

function Transaction::display();
    $display("transaction: data = %0d, id = %0d", data, id);
    $display("error_trans: error_data = %0h, error = %0d\n", err_tr.error_data, err_tr.error);
endfunction

module tb_shallow_copy;
    Transaction tr1, tr2; // punteros a instancias de las clases
    // esto hace una copia de los punteros
    // tr1 = tr2
    
    initial begin
        tr1 = new();
        $display("Calling display method using tr1");
        tr1.display();

        tr2 = new tr1;
        $display("After shallow copy tr1 --> tr2");
        $display("Calling display method using tr2");
        tr2.display();
        $display("--------------------------------");

        tr1.data = 200;
        tr1.id = 2;
        tr1.err_tr.error_data = 32'h1234;
        tr1.err_tr.error = 0;

        $display("Calling display method using tr1");
        tr1.display();
        $display("Calling display method using tr2");
        tr2.display();

    end
endmodule
