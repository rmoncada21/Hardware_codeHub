class Base;
    bit [31:0] data;
    string nombre_clase= "Base";

    function void display_Base();
        $display("Valor de data: %0d", data);
    endfunction
    function void display_name_class();
        $display("Nombre de la clase %s", nombre_clase);
    endfunction
endclass

class subBase extends Base;
    int id;
    string nombre_clase= "subBase";

    function void display_subBase();
        $display("Valor de id: %0d", id);
    endfunction
    
    function void display_name_class();
        $display("Nombre de la clase %s", nombre_clase);
    endfunction
endclass

module main;
    Base clase_base;
    subBase clase_subBase;

    initial begin
        clase_base = new;
        clase_subBase = new;

        clase_base.display_name_class();
        clase_subBase.display_name_class();

        clase_base.data = 32;
        clase_subBase.id = 123456;

        clase_base.display_Base();
        clase_subBase.display_subBase();

        clase_subBase.data = 64;
        clase_subBase.display_Base();
    end
endmodule