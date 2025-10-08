 `ifndef PACKAGE_STRUCT
    `define PACKAGE_STRUCT
    package package_struct;
        parameter version = "package struct 1.1";
        // unpacked y tipo var por defecto
        typedef struct{
            string name;
            int number;
        }myStruct;

        function void print_struct(myStruct data);
            $display("myStruct");
            $display("Nombre: %s number: %d", data.name, data.number);
        endfunction
        
        // packed structs
        // 41 bits en total de almacenamiento
        // valid (1bit) - tag (8 bits) - data (32  bits)
        
        /*No se puede poner valor no integrales dentro
        No son valores integrales:
            real, shortreal
            string
            chandle
            event
            arreglos desempaquetados
            struct o union desempaquetadas
        */
        typedef struct packed {
            logic valid;
            // logic tag [7:0]; arreglo desempaquetado 8 bits separados
            logic [7:0] tag; // arreglo empaquetado de 7 bits
            logic [31:0] data;
        }myPacked_Struct;

        function void print_packedStruct(myPacked_Struct data);
            $display("myPacked_struct");
            $display("Valid: %0h - tag: %0h - data: %0h", data.valid, data.tag, data.data);
        endfunction

        function myPacked_Struct create_myPacked_Struct(logic valid, logic [7:0] tag, logic [31:0] data);
            myPacked_Struct local_struct;
            local_struct.valid = valid;
            local_struct.tag = tag;
            local_struct.data = data;
            return local_struct;;
        endfunction

    endpackage

    import package_struct::*;
`endif