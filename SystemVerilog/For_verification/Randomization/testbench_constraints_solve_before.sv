class seq_item;
    rand bit [7:0] val;
    rand bit enable;
  
    constraint enable_c{ solve enable before val;
                    if(enable == 1) { val inside {[0:10]}; }
                }
endclass

module constraint_example;
    seq_item item;
  
    initial begin
        item = new();

        repeat(10) begin
            item.randomize();
            $display("enable = %0d, val = %0d", item.enable, item.val);
        end
  end
endmodule

/* Salida del programa
enable = 1, val = 3
enable = 0, val = 115
enable = 1, val = 0
enable = 0, val = 209
enable = 0, val = 18
enable = 0, val = 91
enable = 0, val = 36
enable = 0, val = 190
enable = 0, val = 225
enable = 1, val = 3
*/