// class Packet;
//   int id;
//   function new(int i);
//     id = i;
//   endfunction
// endclass

// task automatic do_something(int x); 
//   int local_var;     // stack (automatic)
//   static int count;  // data segment (static)
//   Packet p;          // referencia en stack, objeto en heap
//   begin
//     local_var = x;
//     count++;
//     p = new(count);  // heap allocation
//     $display("[%0t] local=%0d, static=%0d, heap_id=%0d", 
//               $time, local_var, count, p.id);
//   end
// endtask

// module tb;
//   initial begin
//     $display("---- Llamada 1 ----");
//     do_something(5);
    
//     $display("---- Llamada 2 ----");
//     do_something(7);
    
//     $display("---- Llamada 3 ----");
//     do_something(9);

//     $finish;
//   end
// endmodule


// Clase para simular objetos en heap
class Node;
  int value;
  function new(int v);
    value = v;
  endfunction
endclass

module tb;
  // Variable de módulo (data segment, vive toda la simulación)
  int global_var = 100;
  int result;

  // Función recursiva para ilustrar automatic vs static
  function automatic int factorial(int n);
    int temp;               // automatic ? stack
    static int call_count;  // static ? data segment
    call_count++;
    $display("[%0t] factorial(%0d) call=%0d global=%0d", 
              $time, n, call_count, global_var);
    if (n <= 1) return 1;
    else return n * factorial(n-1);
  endfunction

  // Tarea que crea objetos en heap
  task automatic build_nodes(int N);
    int i;      
    Node n;      // referencia local ? stack
    static int id_counter; // persiste entre llamadas
    for (i = 0; i < N; i++) begin
      id_counter++;
      n = new(id_counter);  // heap
      $display("[%0t] Created Node with value=%0d (call=%0d)", 
                $time, n.value, id_counter);
    end
  endtask

  initial begin
    $display("==== Ejemplo: Automatic vs Static vs Heap ====");

    // Uso de global_var
    $display("Global var inicial = %0d", global_var);

    // Ejemplo de recursión con automatic
    // int result;
    result = factorial(4);
    $display("Factorial(4) = %0d", result);

    // Ejemplo de heap (new) + static dentro de tarea
    $display("---- Llamada build_nodes(2) ----");
    build_nodes(2);
    $display("---- Llamada build_nodes(3) ----");
    build_nodes(3);

    $finish;
  end
endmodule
