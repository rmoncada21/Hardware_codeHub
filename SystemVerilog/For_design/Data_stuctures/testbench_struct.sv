`include "package_struct.sv"
// typedef struct{
//     string name;
//     int number;
// }myStruct;

module test_myStruct;
    // unpacked structs
    myStruct variableA;
    myStruct variableB;

    // packed structs
    myPacked_Struct dataA;
    myPacked_Struct dataB;

    initial begin: main
        $display("Version %s", version);

        // forma comun de usar estructuras //
        variableA.name = "variableA";
        variableA.number = 12345;
        print_struct(variableA);

        // Otra forma de inicializar estructuras //
        variableB = '{"variableB", 6789};
        print_struct(variableB);

        // Packed structs
        dataA.valid = 1'h0;
        dataA.tag = 8'hf0;
        dataA.data = 32'hD5;
        package_struct::print_packedStruct(dataA);
        dataA[39:32] = 8'hA0;
        package_struct::print_packedStruct(dataA);

        $display("Usando create_myPacked_Struct function");
        dataB = package_struct::create_myPacked_Struct(1, 8'hC0, 8'hE5);
        package_struct::print_packedStruct(dataB);

    end
endmodule