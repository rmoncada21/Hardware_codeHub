/*
En herencia un constraint de una clase derivada sobreescribe al
contraint de la clase padre. (Sin usar virtual)
*/

class Seq_item;
    rand bit [5:0] value;

    constraint value_c { value>0; value<10; }
endclass

class Seq_item_child extends Seq_item;
    constraint value_c {value>50; value<=100; }
    // constraint value_c {value inside {[50:100]}; }
endclass

module main;
    Seq_item item;
    Seq_item_child item_child;

    initial begin;
        item = new();
        item_child = new();

        repeat(15) begin
            item.randomize();
            $display("Parent class: value = %0d", item.value);
        end

        repeat(15) begin
            item_child.randomize();
            $display("Child class: value = %0d", item_child.value);
        end
    end
endmodule

/*Salida del programa
Parent class: value = 2
Parent class: value = 3
Parent class: value = 6
Parent class: value = 7
Parent class: value = 2
Parent class: value = 2
Parent class: value = 9
Parent class: value = 3
Parent class: value = 6
Parent class: value = 3
Parent class: value = 1
Parent class: value = 1
Parent class: value = 2
Parent class: value = 2
Parent class: value = 8
Child class: value = 50
Child class: value = 63
Child class: value = 53
Child class: value = 54
Child class: value = 55
Child class: value = 53
Child class: value = 53
Child class: value = 50
Child class: value = 53
Child class: value = 50
Child class: value = 62
Child class: value = 61
Child class: value = 61
Child class: value = 59
Child class: value = 50

*/