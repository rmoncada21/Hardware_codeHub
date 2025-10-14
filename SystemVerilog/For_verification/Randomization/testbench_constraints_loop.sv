typedef enum {LOW, MID1, MID2, HIGH} scale;

class Seq_item;
    rand bit [7:0] value[scale]; // arreglo asociativo con llave tipo scale
    rand bit [3:0] array[];

    constraint size_c { value.size() == 4; array.size() inside {[2:5]}; }

    constraint array_c { foreach(array[i]) { array[i] > i*i; }
                        };

    constraint value_c{
                        foreach(value[i]) {
                            value[i] < 100;
                            (i == LOW) -> value[i] < 30;
                            (i == HIGH) -> value[i] > 70;
                            (i == MID1) -> value[i] inside {[30:50]};
                            (i == MID2) -> value[i] inside {[51:70]}; }
                        };
endclass

module main;
    Seq_item item = new();
    
    initial begin
        repeat(5) begin: loop
            item.randomize();
            foreach(item.value[i]) begin
                $display("value[%s] = %0d", i.name(), item.value[i]);
            end

            foreach(item.array[i]) begin
                $display("array[%0d] = %0d", i, item.array[i]);
            end
        end
    end
endmodule

/* Salida del programa
value[LOW] = 19
value[MID1] = 30
value[MID2] = 54
value[HIGH] = 92
array[0] = 11
array[1] = 15
value[LOW] = 11
value[MID1] = 38
value[MID2] = 51
value[HIGH] = 73
array[0] = 2
array[1] = 3
value[LOW] = 10
value[MID1] = 48
value[MID2] = 68
value[HIGH] = 99
array[0] = 6
array[1] = 3
array[2] = 9
array[3] = 12
value[LOW] = 25
value[MID1] = 41
value[MID2] = 64
value[HIGH] = 78
array[0] = 10
array[1] = 14
value[LOW] = 13
value[MID1] = 37
value[MID2] = 55
value[HIGH] = 94
array[0] = 6
array[1] = 15
*/