class ERROR #(parameter WIDTH = 16);
    bit [WIDTH-1:0] code_dead;
    bit error;
endclass

class Driver #(
    parameter WIDTH = 32, 
    type D_TYPE = ERROR #(WIDTH)); // D_TYPE -> ERROR#(WIDTH = 32)

    bit [WIDTH-1:0] data;
    // D_TYPE -> ERROR#(WIDTH = 32)
    // ERROR#(WIDTH = 32) error;
    D_TYPE error;

    function void display();
        $display("[Diver]: data=%0h", this.data);
        $display("[D_TYPE->ERROR]: error.code_dead=%0h, error.error=%0d", 
        error.code_dead, error.error);
    endfunction

    function run();
        error = new;
    endfunction
endclass

module main;
    Driver #(.WIDTH(16)) drv;

    initial begin: one
        drv = new;
        drv.run;
        
        drv.data = 16'hAAAA;
        // datos de ERROR
        drv.error.code_dead = 16'hC0DE;
        drv.error.error = 1;
        drv.display();
    end
endmodule