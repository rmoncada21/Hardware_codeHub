/*
    La clase base y la clase derivada tiene las
    mismas propiedades (variables, funciones)
*/

class Driver;
    bit [31:0] data;
    bit [2:0] id;

    // permite que las clases derivadas sobreescriban
    // el método del mismo nombre
    virtual function void display();
        $display("[Driver]: data=%0h, id=%03b", data, id);
    endfunction

endclass

class UartDriver extends Driver;
    bit [31:0] data;
    bit [2:0] id;

    function void display();
        $display("[UartDriver]: data=%0h, id=%03b", data, id);
    endfunction
endclass

module main;
    // punteros las clases
    Driver drv_to, drv;
    UartDriver uart_drv;

    initial begin: one
        $display("\nFirst initial");
        drv = new;;

        drv.data = 32'hC0DE_DEAD;
        drv.id = 3'b001;
        drv.display();
        // First initial
        // [Driver]: data=c0dedead, id=001
    end: one

    initial begin: two
        $display("\Second initial");
        uart_drv = new;

        drv_to = uart_drv;
        drv_to.display();
        
        // Second initial
        // [UartDriver]: data=0, id=000
    end
endmodule