`define START_RANGE 35
`define END_RANGE 45

class seq_item #(parameter int p1 = 10, p2 = 20);
    rand bit [7:0] value1;
    rand bit [7:0] value2;
    rand bit [7:0] value3;
    rand bit [7:0] value4;
    rand bit [7:0] value5;
    rand bit [7:0] value6;
    rand bit [7:0] value7;

    constraint value1_c {value1 inside {[10:20]};} // constant value based range
    constraint value2_c {value2 inside {40,70, 80};} // Set of values
    constraint value3_c {value3 inside {[10:20], 21, 23, [25:30], 40, 70, 80};} // Mix
    constraint value4_c {!(value4 inside {[100:200]});} // Inverted Range
    constraint value5_c {value5 inside {[value1:value2]};} // range using variable 
    constraint value6_c {value6 inside {[`START_RANGE:`END_RANGE]};} // Define based range
    constraint value7_c {value7 inside {[p1:p2]};} // parameter based range
endclass

module constraint_example;
    seq_item #(100, 200) item;
  
    initial begin
        item = new();
    
    repeat(20) begin
        item.randomize();
        $display("value1 = %0d, value2 = %0d, value3 = %0d, value4 = %0d, value5 = %0d, value6 = %0d, value7 = %0d", 
            item.value1, item.value2, item.value3, item.value4, item.value5, item.value6,  item.value7);
    end
  end
endmodule

/* Salida del programa
value1 = 16, value2 = 40, value3 = 20, value4 = 208, value5 = 33, value6 = 43, value7 = 104
value1 = 15, value2 = 70, value3 = 10, value4 = 12, value5 = 54, value6 = 43, value7 = 113
value1 = 14, value2 = 70, value3 = 17, value4 = 240, value5 = 32, value6 = 40, value7 = 146
value1 = 15, value2 = 70, value3 = 21, value4 = 212, value5 = 24, value6 = 43, value7 = 185
value1 = 12, value2 = 40, value3 = 14, value4 = 25, value5 = 32, value6 = 42, value7 = 154
value1 = 14, value2 = 80, value3 = 16, value4 = 71, value5 = 40, value6 = 44, value7 = 153
value1 = 16, value2 = 40, value3 = 20, value4 = 209, value5 = 20, value6 = 43, value7 = 179
value1 = 17, value2 = 40, value3 = 11, value4 = 207, value5 = 35, value6 = 38, value7 = 168
value1 = 15, value2 = 70, value3 = 17, value4 = 205, value5 = 55, value6 = 43, value7 = 121
value1 = 13, value2 = 80, value3 = 15, value4 = 48, value5 = 64, value6 = 43, value7 = 176
value1 = 20, value2 = 80, value3 = 21, value4 = 201, value5 = 59, value6 = 37, value7 = 144
value1 = 13, value2 = 40, value3 = 10, value4 = 19, value5 = 39, value6 = 37, value7 = 174
value1 = 20, value2 = 40, value3 = 20, value4 = 89, value5 = 32, value6 = 44, value7 = 128
value1 = 14, value2 = 40, value3 = 21, value4 = 46, value5 = 34, value6 = 36, value7 = 129
value1 = 14, value2 = 70, value3 = 11, value4 = 22, value5 = 27, value6 = 35, value7 = 152
value1 = 15, value2 = 70, value3 = 13, value4 = 87, value5 = 28, value6 = 38, value7 = 123
value1 = 20, value2 = 70, value3 = 17, value4 = 60, value5 = 27, value6 = 44, value7 = 176
value1 = 14, value2 = 80, value3 = 14, value4 = 41, value5 = 15, value6 = 45, value7 = 117
value1 = 13, value2 = 80, value3 = 40, value4 = 89, value5 = 79, value6 = 45, value7 = 106
value1 = 14, value2 = 80, value3 = 30, value4 = 246, value5 = 28, value6 = 40, value7 = 109
*/