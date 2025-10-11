class error_trans;
  bit [31:0] err_data;
  bit error;
  
  extern function new(bit [31:0], bit);
endclass

function error_trans::new(bit [31:0] err_data, bit error);
    this.err_data = err_data;
    this.error = error;
endfunction

class Transaction;
  bit [31:0] data;
  int id;
  error_trans err_tr;
  
  extern function new();
  extern function void display();
  extern function deep_copy(Transaction tr);
endclass

function Transaction::new();
    this.data = 100;
    this.id = 1;
    this.err_tr = new(32'hFFFF_FFFF, 1);
endfunction
  
function void Transaction::display();
    $display("transaction: data = %0d, id = %0d", data, id);
    $display("error_trans: err_data = %0h, error = %0d\n", err_tr.err_data, err_tr.error);
endfunction
  
function Transaction::deep_copy(Transaction tr);
    this.data = tr.data;
    this.id = tr.id;
    this.err_tr.err_data = tr.err_tr.err_data;
    this.err_tr.error = tr.err_tr.error;
endfunction

module deep_copy_example;
  Transaction tr1, tr2;
  
  initial begin
    tr1 = new();
    $display("Calling display method using tr1");
    tr1.display();
    
    tr2 = new();
    tr2.deep_copy(tr1);
    $display("After deep copy tr1 --> tr2");
    $display("Calling display method using tr2");
    tr2.display();
    $display("--------------------------------");
    
    tr1.data = 200;
    tr1.id = 2;
    tr1.err_tr.err_data = 32'h1234;
    tr1.err_tr.error = 0;
    
    $display("Calling display method using tr1");
    tr1.display();
    $display("Calling display method using tr2");
    tr2.display();
    
  end
endmodule