/*
    ejemplo de instanciación
    Driver drv;
    Driver #(16, int) -> D_TYPE es como un template
*/
class Driver #(parameter WIDTH = 32, type D_TYPE = bit [2:0]);
    bit [WIDTH-1:0] data;
    D_TYPE id; // se puede cambiar a DTYPE = int, para int id

    function void display();
        $display("data=%0h, id = %03d", data, id);
    endfunction
endclass

module main;
    Driver drv;
    Driver #(16, int) drv2;

    initial begin: one
        drv = new; // por defecto
        drv2 = new;

        drv.data = 32'hC0DE_DEAD;
        drv.id = 1;

        drv2.data = 16'hC0DE;
        drv2.id = 3;

        drv.display();
        drv2.display();
    end
endmodule