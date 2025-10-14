class Seq_item;
    rand bit [7:0] value1;
    rand bit [7:0] value2 = 7'b1110011;

    constraint value1_c { value1 inside {[10:30]}; }
    constraint value2_c { value2 inside {40, 70, 80}; }
endclass

module main;
    Seq_item item;

    initial begin
        item = new;

        item.randomize();
        $display("Before disabling randomization: value1 = %0d, value2 = %0d", 
                item.value1, item.value2);
    
        item.rand_mode(0);
        $display("After disabling randomization for all variables in a class");
        item.randomize(); // no hace nada ya que se desactvó con item.rand_mode(0);
        $display("Retain old values: value1 = %0d, value2 = %0d", 
                item.value1, item.value2);

        item.rand_mode(1); // se vuelve acctivar
        item.randomize();
        $display("After enabling randomization: value1 = %0d, value2 = %0d", 
                item.value1, item.value2);

        item.value2.rand_mode(0);
        item.randomize();
        $display("After disabling randomization for value2 variables in a class: value1 = %0d, value2 = %0d", 
                item.value1, item.value2);

        $display("rand_mode function returns for value1 = %0d, value2 = %0d", 
                item.value1.rand_mode(), item.value2.rand_mode());
    
    end
endmodule
/*
Before disabling randomization: value1 = 14, value2 = 70
After disabling randomization for all variables in a class
Retain old values: value1 = 14, value2 = 70
After enabling randomization: value1 = 15, value2 = 80
After disabling randomization for value2 variables in a class: value1 = 22, value2 = 80
rand_mode function returns for value1 = 1, value2 = 0
*/