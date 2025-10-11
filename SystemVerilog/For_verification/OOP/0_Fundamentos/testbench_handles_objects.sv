class transaction;
    bit [31:0] data;
    int id;

    // constructor por defecto
    extern function new(bit [31:0] data=1, int id=1);
    
    // constructor con parametros
    extern task update(bit [31:0], int);

    // mostrar datos
    extern function void print();

endclass: transaction

function void transaction::print();
    $display("data:%h - id:%d", this.data, this.id);
endfunction: print

task transaction::update(bit [31:0] data, int id);
        this.data = data;
        this.id = id;
endtask: update

function transaction::new(bit [31:0] data=1, int id=1 );
        this.data =  data;
        this.id = id;
endfunction: new

module testbench;
    transaction tr1=null, tr2=null; // punteros

    initial begin: main
        transaction tr3 = new(); // variable local al initial
        tr1 = new(); tr2 = new();

        tr1.update(10, 100);
        tr2.update(20, 200);
        // tr3.update(30, 300);

        tr1.print();
        tr2.print();
        tr3.print();
    end
endmodule