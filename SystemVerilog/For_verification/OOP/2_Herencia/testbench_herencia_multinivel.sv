class Class_raiz;
    bit [31:0] data_r;

    function void display_r();
        $display("[Class_raiz] data_p: %0d", data_r);
    endfunction
endclass

class Class_nodo1 extends Class_raiz;
    bit [31:0] data_n1;

    function void display_n1();
        $display("[Class_nodo1] data_n1: %0d", data_n1);
    endfunction
endclass

class Class_nodo2 extends Class_raiz;
    bit [31:0] data_n2;

    function void display_n2();
        $display("[Class_nodo2] data_n2: %0d", data_n2);
    endfunction
endclass

class Class_nodoA extends Class_nodo1;
    bit [31:0] data_nA;

    function void display_nA();
        $display("[Class_nodoA] data_nA: %0d", data_nA);
    endfunction
endclass

class Class_nodoB extends Class_nodoA;
    bit [31:0] data_nB;

    function void display_nB();
        $display("[Class_nodoB] data_nB: %0d", data_nB);
    endfunction
endclass

module main;
    Class_nodoB cnb;
    // cnb = new; no se puede

    initial begin
        cnb = new;
        cnb.data_r = 1;
        cnb.data_n1 = 2;
        cnb.data_nA = 3;
        cnb.data_nB = 4;
    
        cnb.display_r();
        cnb.display_n1();
        cnb.display_nA();
        cnb.display_nB();
    end
endmodule