`define RESET       "\033[0m"
`define RED         "\033[31m"
`define GREEN       "\033[32m"
`define YELLOW      "\033[33m"
`define BLUE        "\033[34m"
`define MAGENTA     "\033[35m"
`define CYAN        "\033[36m"
`define BOLD        "\033[1m"

`define BOLD_RED    "\033[1;31m"
`define BOLD_CYAN   "\033[1;36m"
`define BOLD_GREEN  "\033[1;32m"
`define BOLD_YELLOW "\033[1;33m"

`define INFO(msg)    $display({`CYAN,   "[INFO]  ", msg, `RESET});
`define WARN(msg)    $display({`YELLOW, "[WARN]  ", msg, `RESET});
`define ERROR(msg)   $display({`RED,    "[ERROR] ", msg, `RESET});

module color_macro_example;
  initial begin

    $display("\033[31mEste texto es rojo\033[0m");
    $display("\033[32mEste texto es verde\033[0m");
    $display("\033[1;33mEste texto es amarillo y en negrita\033[0m");
    
    $display({`RED,   "Este texto es rojo" ,`RESET});
    $display({`GREEN, "Este texto es verde" ,`RESET});
    $display({`BOLD_YELLOW, "Advertencia importante" ,`RESET});

    `INFO("Simulación iniciada")
    `WARN("Variable sin usar")
    `ERROR("Valor fuera de rango")
  end
endmodule

// localparam string  BOLD_CYAN = "\033[1;33m";
// localparam string RESET = "\033[0m";