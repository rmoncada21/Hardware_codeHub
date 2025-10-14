class Seq_item;
    rand bit [7:0] value;
    rand enum {LOW, MEDIUM, HIGH} scale;

    constraint scale_c {if(scale == LOW) value<35;
                        else if(scale == MEDIUM) value>35 && value<65;
                        else value >=65 && value <=100;
                        }
endclass

module main;
    Seq_item item;

    initial begin
        item = new();

        repeat(20) begin
            item.randomize();
            $display("scale = %7s, value = %0d", item.scale.name(), item.value);
        end
    end
endmodule

/*
scale =    HIGH, value = 85
scale =  MEDIUM, value = 60
scale =     LOW, value = 0
scale =     LOW, value = 32
scale =     LOW, value = 9
scale =  MEDIUM, value = 54
scale =     LOW, value = 18
scale =     LOW, value = 31
scale =     LOW, value = 33
scale =    HIGH, value = 85
scale =    HIGH, value = 100
scale =     LOW, value = 25
scale =     LOW, value = 15
scale =    HIGH, value = 83
scale =  MEDIUM, value = 46
scale =     LOW, value = 34
scale =  MEDIUM, value = 46
scale =  MEDIUM, value = 38
scale =    HIGH, value = 75
scale =  MEDIUM, value = 39

*/