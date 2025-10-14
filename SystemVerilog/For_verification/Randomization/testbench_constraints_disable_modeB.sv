class Seq_item;
    rand bit [7:0] value1;
    rand bit [7:0] value2;

    constraint value1_c {value1 inside {[10:30]};}
    constraint value2_c {value2 inside {40,70, 80};}

endclass

module constraint_example;
    Seq_item item;
  
    initial begin
        item = new();
    
        item.randomize();
        $display("Before disabling constraint");
        $display("item: value1 = %0d, value2 = %0d", item.value1, item.value2);
        
        item.value2_c.constraint_mode(0);  // To disable constraint for value2 using handle item2
        item.randomize();
        $display("After disabling constraint for all value2 alone");
        $display("item: value1 = %0d, value2 = %0d", item.value1, item.value2);
        $display("constraint_mode function returns for value1 = %0d, value2 = %0d",
                item.value1_c.constraint_mode(), item.value2_c.constraint_mode());
    end
endmodule

/*Salida del programa
Before disabling constraint
item: value1 = 14, value2 = 70
After disabling constraint for all value2 alone
item: value1 = 15, value2 = 63
constraint_mode function returns for value1 = 1, value2 = 0
*/