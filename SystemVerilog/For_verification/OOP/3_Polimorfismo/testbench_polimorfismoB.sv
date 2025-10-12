/*
Solo la clase base tiene propiedades.    
    Dado que las variables solo se declaran en la clase base, 
    ambas clases tendrán acceso a la misma ubicación de memoria. 
    Por lo tanto, los valores modificados por la clase hija también 
    se reflejan cuando el manejador de la clase base accede a ellos.
*/

class Driver;
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
        drv = new;
        uart_drv = new;

        uart_drv.data = 32'hC0DE_ABCD;
        uart_drv.id = 3'b111;
        uart_drv.display(); // [UartDriver]: data=c0deabcd, id=111

        drv = uart_drv;
        drv.display(); // [Driver]: data=c0deabcd, id=111
        drv.data = 32'hC0DE_DEAD;
        drv.id = 3'b000;
        drv.display(); // [Driver]: data=c0dedead, id=000
        uart_drv.display(); // [UartDriver]: data=c0dedead, id=000
    end
endmodule
