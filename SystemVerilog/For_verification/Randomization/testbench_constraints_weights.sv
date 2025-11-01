/* Distribuciones de peso
[3:0] := 10 3,2,1,0 valen 10 cada uno
[3:0] :/ 10 3,2,1,0 valen 10/4 cada uno
*/
class Seq_item;
    rand bit [7:0] value1;
    rand bit [7:0] value2;

    constraint value1_c { value1 dist { 3:/4, [5:8]:/7 }; }
    constraint value2_c { value2 dist { 3:=4, [5:8]:=7 }; }
endclass

module main;
    Seq_item item;

    initial begin
        item = new;

        repeat(30) begin
            item.randomize();
            $display("value1 (with :/) = %0d, value2 (with :=)= %0d", 
                    item.value1, item.value2);
        end        
    end
endmodule
// constraint value1_c { value1 dist { 3:/4, [5:8]:/7 }; }
// constraint value2_c { value2 dist { 3:=4, [5:8]:=7 }; }

/* Salida del programa
value1 (with :/) = 3, value2 (with :=)= 8
value1 (with :/) = 5, value2 (with :=)= 5
value1 (with :/) = 3, value2 (with :=)= 7
value1 (with :/) = 3, value2 (with :=)= 6
value1 (with :/) = 3, value2 (with :=)= 6
value1 (with :/) = 5, value2 (with :=)= 7
value1 (with :/) = 3, value2 (with :=)= 8
value1 (with :/) = 5, value2 (with :=)= 3
value1 (with :/) = 7, value2 (with :=)= 3
value1 (with :/) = 3, value2 (with :=)= 6
value1 (with :/) = 5, value2 (with :=)= 6
value1 (with :/) = 3, value2 (with :=)= 3
value1 (with :/) = 3, value2 (with :=)= 8
value1 (with :/) = 5, value2 (with :=)= 3
value1 (with :/) = 8, value2 (with :=)= 3
value1 (with :/) = 3, value2 (with :=)= 3
value1 (with :/) = 7, value2 (with :=)= 7
value1 (with :/) = 3, value2 (with :=)= 3
value1 (with :/) = 7, value2 (with :=)= 8
value1 (with :/) = 8, value2 (with :=)= 8
value1 (with :/) = 3, value2 (with :=)= 8
value1 (with :/) = 7, value2 (with :=)= 6
value1 (with :/) = 7, value2 (with :=)= 6
value1 (with :/) = 3, value2 (with :=)= 7
value1 (with :/) = 8, value2 (with :=)= 5
value1 (with :/) = 3, value2 (with :=)= 3
value1 (with :/) = 7, value2 (with :=)= 5
value1 (with :/) = 3, value2 (with :=)= 6
value1 (with :/) = 7, value2 (with :=)= 8
value1 (with :/) = 7, value2 (with :=)= 6

*/