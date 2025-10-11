#!/bin/env bash

################### Ejemplos de comandos de compilación ###################
# Verificar sintaxis sin generar archivo ejecutable
# - iverilog -g2012 -Wall -Wextra -t null archivo.v
# Compilar un archivo .v generando ejecutable
# - iverilog -g2012 -Wall -Wextra archivo.v -o bin/archivo
# Ejecutar un testbench compilado
# - vvp bin/testbench_modulos
# Ver archivo de onda .vcd con gtkwave
# - gtkwave gtkwave/archivo.vcd

# Colores ANSI: formato de salida
RESET="\033[0m"
ROJO="\033[31m"

AZUL_BRILLANTE="\033[94m"
VERDE_BRILLANTE="\033[92m"
CIAN_BRILLANTE="\033[96m"

AZUL_FONDO="\033[44m"
ROJO_FONDO="\033[41m"

_vcompile_autocomplete(){
    local cur="${COMP_WORDS[COMP_CWORD]}"
    # profundidad 2 para buscar en carpetas del directorio incluyendo bin/
    local options0=( -help syntax clean)
    local options1=$(find . -maxdepth 2 -type f \( -name "*.v" \) -printf "%f\n")
    
    local options=( "${options0[@]}" "${options1[@]}" )
    COMPREPLY=( $(compgen -W "${options[*]}" -- "${cur}") )
}
complete -F _vcompile_autocomplete vcompile

vcompile(){
    echo -e "${AZUL_FONDO}vcompile en bash${RESET}\n"

    local file="$1"
    local file_ext="${file##*.}"
    local testbench_file="${file#testbench_}"
    
    # local cantidad_arg="$#"
    # echo "Nombre arhivo: $file"
    # echo "Extension arhivo: $file_ext"
    # echo "Nombre testbench: $testbench_file"
    # echo "Nombre testbench_vvp: $testbench_exe"

    if [[ -z "$file" ]]; then
        echo -e "${ROJO_FONDO}Sin archivo de entrada.${RESET}"
        return 1
    fi

    if [[ "$file" == *.* ]]; then # verificar si el arhivo tiene extension
        # echo "Con extension"
        if [[ "$file_ext" == "v" ]]; then
            mkdir -p bin
            if [[ "$file" == testbench_* ]]; then
                echo -e "${AZUL_BRILLANTE}vcompile${RESET} ${VERDE_BRILLANTE}$file${RESET}"
                echo -e "iverilog -g2012 -Wall $file -o bin/${CIAN_BRILLANTE}${file%.v}_vvp${RESET}\n"
                iverilog -g2012 -Wall "$file" -o bin/${file%.v}_vvp
            else
                echo -e "${AZUL_BRILLANTE}vcompile-syntax${RESET} ${VERDE_BRILLANTE}$file${RESET}"
                echo -e "iverilog -g2012 -Wall -t null $file\n"
                iverilog -g2012 -Wall -t null "$file"
            fi
        elif [[ "$file_ext" == vcd ]]; then # para gtkwave
            mkdir -p gtkwave
            echo -e "${AZUL_BRILLANTE}Abriendo con GTKWave:${RESET} ${VERDE_BRILLANTE}$file${RESET}"
            echo -e "gtkwave gtkwave/$file\n"
            gtkwave gtkwave/$file
        else
            echo -e "${ROJO_FONDO} vcompile no admite este tipo de archivo:${RESET} ${VERDE_BRILLANTE}$file${RESET}\n"
            return 1
        fi
    else # Ejecutable
        # echo "Sin extension"
        if [[ "$file" == *_vvp ]]; then
            echo -e "${AZUL_BRILLANTE}vvp${RESET} ${VERDE_BRILLANTE}$file${RESET}"
            echo -e "vvp bin/$file\n"
            vvp bin/$file
        elif [[ "$file" == "clean" ]]; then
            echo -e "${AZUL_BRILLANTE}rm -rf bin gtkwave${RESET}"
            rm -rf bin gtkwave
        else
            echo -e "${ROJO_FONDO}Archivo no admitido:${RESET} ${VERDE_BRILLANTE}$file${RESET}\n"
            return 1
        fi
    fi
}
