/*
Clase padre que hereda el dato code
*/
class Driver;
    bit [31:0] code = 32'hC0DE_C0DE;
    
    virtual function void display();
        $display("[Driver base]: code=%0h", code);
    endfunction

endclass

class UartDriver extends Driver;

    function void display();
        $display("[UartDriver derivada]: code=%0h", this.code);
    endfunction

endclass

class SpiDriver extends Driver;

    function void display();
        $display("[SpiDriver derivada]: code=%0h", this.code);
    endfunction
    
endclass

module main;
    Driver drv; // crea solo el puntero de la clase padre
    UartDriver uart_drv;
    SpiDriver spi_drv;

    initial begin
        uart_drv = new;
        spi_drv = new;

        uart_drv.code = 32'hC0DE_AAAA;
        spi_drv.code = 32'hC0DE_BBBB;

        uart_drv.display();
        spi_drv.display();

        // Usar puntero de clase padre
        $display("Usando puntero de drv para acceder a UART - SPI");
        drv = uart_drv;
        drv.code = 32'hDEAD_0000;
        drv.display();

        drv = spi_drv;
        drv.code = 32'hDEAD_0001;
        drv.display();
    end
endmodule