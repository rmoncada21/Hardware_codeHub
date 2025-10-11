class Transaction;
    static int st_id;
    int id;
    extern static function void display();
    extern function new();
endclass

static function void Transaction::display(); // Static function
    
    $display("Valor de st_id: %0d", st_id);
    // funciones static no pueden acceder a non-static
    // illegal access
    //id++;
endfunction

function Transaction::new();
    this.st_id++;
    this.id++;
endfunction


module tb_static;
    Transaction tr[5]; // arreglo de tipo clase
    Transaction trA;

    initial begin: main
        foreach(tr[i]) begin
            tr[i] = new();
            $display("Value of st_id = %0h, id = %0h", tr[i].st_id, tr[i].id);
        end

        // Hacer st_id++ desde la clase base Transaction
        $display("Do Transaction::st_id++"); Transaction::st_id++;
        Transaction::display();
        
        // Hacer st_id++ desde trA
        $display("Do trA.st_id++");
        trA.st_id++;
        $display("trA.st_id: %0d", trA.st_id);
        Transaction::display();
    end
endmodule