/*
    La clase base y la clase derivada tiene las
    mismas propiedades (variables, funciones)
    
    Dado que las variables se declaran en ambas clases, 
    se asigna memoria independiente. Por lo tanto, 
    los valores de la clase base no son sobrescritos 
    por su clase hija.
*/

class Driver;
    bit [31:0] data;
    bit [2:0] id;

    function void display();
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
        drv = new;
        drv.data = 32'C0DE_DEAD;
        drv.id = 3'b001;
        drv.display();
    end: one
    // First initial
    // [Driver]: data=deaddead, id=100

    initial begin: two
        $display("\nSecond initial");
        uart_drv = new();
        // copiando los punteros
        // Haciendo de un puntero drv_to un puntero uart_drv
        drv_to = uart_drv;

        drv_to.data = 32'hC0DE_DEAD;
        drv_to.id = 3'b000;
        

        uart_drv.data = 32'hC0DE_ABCD;
        uart_drv.id = 3'b111;
        
        drv_to.display();
        uart_drv.display();
    end
    // Second initial
    // [Driver]: data=c0dedead, id=000
    // [UartDriver]: data=c0deabcd, id=111
endmodule