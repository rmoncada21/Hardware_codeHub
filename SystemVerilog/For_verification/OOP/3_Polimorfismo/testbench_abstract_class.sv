/*
    virtual class define una clase abstracta que no puede 
    instanciarse directamente.  
*/
virtual class Driver;
    bit [31:0] data;
    bit [2:0] id;

    function void display();
        $display("[Driver]: data=%0h, id=%03b", data, id);
    endfunction

endclass

class UartDriver extends Driver;
    function void display();
        $display("[UartDriver]: data=%0h, id=%03b", data, id);
    endfunction
endclass

module main;
    Driver drv; 
    UartDriver uart_drv;

    initial begin: one
        /* main, "drv = new();"
            Instantiation of the object 'drv' can not be done because 
            its type 'Driver' is an abstract base class.
        */
        // drv = new;
        uart_drv = new;
        drv = uart_drv;
        uart_drv.data = 32'hC0DE_ABCD;
        uart_drv.id = 3'b111;
        uart_drv.display();
        drv.display();
    end
endmodule