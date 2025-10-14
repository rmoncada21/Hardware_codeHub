class Seq_item;
    rand bit [7:0] value;
    rand enum {LOW, HIGH} scale;

    constraint scale_c{ value == ((scale==LOW) ? 0:95 ); }
endclass


module main;
    Seq_item item;

    initial begin
        item = new();

        repeat(10) begin
            item.randomize();
            $display("scale=%7s, value=%2d", item.scale.name(), item.value);
        end
    end
endmodule

/* Salida del programa
scale=   HIGH, value=95
scale=    LOW, value= 0
scale=   HIGH, value=95
scale=    LOW, value= 0
scale=    LOW, value= 0
scale=    LOW, value= 0
scale=    LOW, value= 0
scale=    LOW, value= 0
scale=    LOW, value= 0
scale=   HIGH, value=95
*/