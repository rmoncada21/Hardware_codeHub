module testbench_sumador_4bits_mnc;
    reg [3:0] Atb, Btb;
    reg [3:0] Sumatb;
    reg Acarreo_entrada_tb;
    // Acarreo la entrada 3 es una salida del sumador completo
    wire reg  Acarreo_suma_4bits_tb;

    // Vectores del test
    reg [3:0] values [0:15];
    // Instanciar el modulo
    sumador_4bits_mnc uut(
        .A(Atb),
        .B(Btb),
        .Suma(Sumatb),
        .Acarreo_entrada(Acarreo_entrada_tb),
        .Acarreo_suma_4bits(Acarreo_suma_4bits_tb)
    );

    // Tareas del test
    // gen_values - mostrar_Values - put_values - mostrar_entrada_Salida
    task gen_values;
        for(int i=0; i<=15; i++) begin
            values[i]=i;
        end
    endtask

    task mostrar_values;
        $display("Tabla con los posibles valores de entrada para A");
        $display("3210   Posiciones");
        for(int i=0; i<=15; i++) begin
            $display("%4b", values[i]);
        end
    endtask

    task put_values;
        // Generar numero random
        reg [3:0] opcion_random;
        opcion_random = $urandom_range(0,15);

        // Poner valores
        Btb = 4'b0001;
        Atb = values[opcion_random];
        Acarreo_entrada_tb = 1'b0;
        #10;
    endtask

    task mostrar_entrada_salida;
        $display("A+B-> %b+%b = %b", Atb, Btb, {Acarreo_suma_4bits_tb,Sumatb});
    endtask

    task verify;
        reg [4:0] suma_task;
        suma_task = Atb + Btb;
        $display("Suma task = %b", suma_task);

        if({Acarreo_suma_4bits_tb,Sumatb} == suma_task) begin
            $display("Prueba correcta ");
        end else begin
            $display("ERROR");
        end 
    endtask

    initial begin
        gen_values;
        mostrar_values;
        repeat(20) begin
            put_values;
            mostrar_entrada_salida;
            verify;
            $display(" ");
        end
    end 
endmodule