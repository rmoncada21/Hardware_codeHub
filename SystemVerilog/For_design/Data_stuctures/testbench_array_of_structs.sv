// Ejemplo de chipverify
// Define the structure
typedef struct {
  int data;
  string name;
} MyStruct;

module array_examples;

  // 1. Fixed Array
  MyStruct arreglo[5];

  // 2. Dynamic Array
  MyStruct arreglo_dinamico[];

  // 3. Associative Array
  MyStruct arreglo_asociativo[int];

  initial begin
    $display("--- Arreglo estático de tipo MyStruct Example ---");
    // Populate the fixed array
    for (int i = 0; i < 5; i++) begin
      arreglo[i].data = i * 10;
      arreglo[i].name = $sformatf("Fixed_%0d", i);
      $display("arreglo[%0d]: data=%0d, name=%s", i, arreglo[i].data, arreglo[i].name);
    end

    $display("--- Arreglo dinámico de tipo MyStruct Example ---");
    // Initialize and populate the dynamic array
    arreglo_dinamico = new[3]; // Allocate space for 3 elements

    arreglo_dinamico[0].data = 100;
    arreglo_dinamico[0].name = "Dynamic_A";

    arreglo_dinamico[1].data = 200;
    arreglo_dinamico[1].name = "Dynamic_B";

    arreglo_dinamico[2].data = 300;
    arreglo_dinamico[2].name = "Dynamic_C";


    for (int i = 0; i < arreglo_dinamico.size(); i++) begin
      $display("arreglo_dinamico[%0d]: data=%0d, name=%s", i, arreglo_dinamico[i].data, arreglo_dinamico[i].name);
    end

    $display("--- Arreglo Asociativo de tipo MyStruct Example ---");
    // Populate the associative array using keys
    arreglo_asociativo[10] = '{101, "Assoc_X"};
    arreglo_asociativo[25] = '{202, "Assoc_Y"};
	arreglo_asociativo[5]  = '{303, "Assoc_Z"}; // Keys don't need to be in order


    // Iterating through associative array (keys are returned in sorted order)
    $display("Iterating through arreglo_asociativo:");
    foreach (arreglo_asociativo[key]) begin
      $display("arreglo_asociativo[%0d]: data=%0d, name=%s", key, arreglo_asociativo[key].data, arreglo_asociativo[key].name);
    end
  end

endmodule