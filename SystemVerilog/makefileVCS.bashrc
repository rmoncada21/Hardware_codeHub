#!/bin/env bash

# --------------------------------------------------
# makefileVCS en bash
# --------------------------------------------------

# Verificar solo sintaxis con vlogan
#   vlogan +lint=all -full64 -sverilog -work bin archivo.sv
#   genera la carpeta AN.DB

# compilar con VCS - VCS user guide PAG 98
#   vcs -full64 -sverilog archivo.sv -o sim/archivo_sim
#   genera carpetas: cscr, simv.daidir
#   genera archivos: simv

#   vcs -Mupdate -full64 -sverilog archivo.sv -o sim/archivo_simv -Mdir=bin -l folder_loglog_test +lint=TFIPC-L
#   genera log_test como archivo extra

#   compilar con UVM
#   vcs -Mupdate -full64 -sverilog -ntb_opts uvm-1.2 testbench.sv -o simv -l compile.log +lint=TFIPC-L -Mdir=build

# Compilar para para debug con verdi
#   vcs -Mupdate -full64 -sverilog testbench.sv -o simv -l compile.log +lint=TFIPC-L \
#   -kdb -debug_pp -debug_acc+all -debug_region+cell+encrypt +assert \
#   -cm line+tgl+cond+fsm+branch +define+DUMP_FSDB \
#   -cm_report unencrypted_hierarchies+svpackages+noinitial \
#   -Mdir=build
#   genera


# Colores ANSI: formato de salida
RESET="\033[0m"
ROJO="\033[31m"

AZUL_BRILLANTE="\033[94m"
VERDE_BRILLANTE="\033[92m"
CIAN_BRILLANTE="\033[96m"

AZUL_FONDO="\033[44m"
ROJO_FONDO="\033[41m"

_vcscompile_autocomplete(){
    local cur="${COMP_WORDS[COMP_CWORD]}"
    # profundidad 2 para buscar en carpetas del directorio incluyendo bin y sim/
    local options0=( -help clean )
    local options1=$(find . -maxdepth 2 -type f \( -name "*.sv" \) -printf "%f\n")
    
    local options=( "${options0[@]}" "${options1[@]}" )
    COMPREPLY=( $(compgen -W "${options[*]}" -- "${cur}") )
}
complete -F _vcscompile_autocomplete vcscompile

vcscompile(){
    echo -e "${AZUL_FONDO}vcscompile en bash${RESET}\n"

    local file="$1"
    local file_ext="${file##*.}"
    local testbench_file="${file#testbench_}"

    if [[ -z "$file" ]]; then
        echo -e "${ROJO_FONDO}Sin archivo de entrada.${RESET}"
        return 1
    fi

    if [[ "$file" == *.* ]]; then # verificar si el arhivo tiene extension
        # echo "Con extension"
        if [[ "$file_ext" == "sv" ]]; then
            mkdir -p bin sim log
            if [[ "$file" == testbench_* ]]; then
                echo -e "${AZUL_BRILLANTE}vcscompile${RESET} ${VERDE_BRILLANTE}$file${RESET}"
                echo -e "vcs -Mupdate -full64 -sverilog $file -o sim/${CIAN_BRILLANTE}${file%.sv}_sim${RESET} -Mdir=bin -l log/log_${file%.sv} \n"
                vcs -Mupdate -full64 -sverilog "$file" -o sim/${file%.sv}_sim -Mdir=bin -l log/log_test
            else # para revisar sintaxis
                echo -e "${AZUL_BRILLANTE}vcscompile-syntax${RESET} ${VERDE_BRILLANTE}$file${RESET}"
                echo -e "vlogan +lint=all -full64 -sverilog $file\n"
                vlogan +lint=all -full64 -sverilog "$file"
            fi
        elif [[ "$file_ext" == vcd ]]; then # para VERDI .fsdb
            # mkdir -p gtkwave
            echo -e "${ROJO_FONDO}Actualizar -> gtkwave a VERDI${RESET}"
            # echo -e "${ROJO_FONDO}Actualiar función${RESET}"
            # echo -e "${AZUL_BRILLANTE}Abriendo con GTKWave:${RESET} ${VERDE_BRILLANTE}$file${RESET}"
            # echo -e "gtkwave gtkwave/$file\n"
            # gtkwave gtkwave/$file
        else
            echo -e "${ROJO_FONDO} vcscompile no admite este tipo de archivo:${RESET} ${VERDE_BRILLANTE}$file${RESET}\n"
            return 1
        fi
    else # Ejecutable
        # echo "Sin extension pero con terminación _sim"
        if [[ "$file" == *_sim ]]; then
            echo -e "${AZUL_BRILLANTE}Ejecutando${RESET} ${VERDE_BRILLANTE}./sim/$file${RESET}"
            echo -e "./sim/$file\n"
            ./sim/$file
        elif [[ "$file" == "-help" ]]; then
            # echo -e "${AZUL_FONDO}==================== ${VERDE_BRILLANTE}VCS Compile Help${AZUL_FONDO} ====================${RESET}\n"
            echo -e "$==================== ${VERDE_BRILLANTE}VCSCompile Help${RESET} ====================\n"

            # echo -e "${CIAN_BRILLANTE}Uso:${RESET}"
            echo -e "Uso:"
            echo -e "  ${VERDE_BRILLANTE}vcscompile <archivo.sv>${RESET}            - Revisa sintaxis de un archivo SystemVerilog"
            echo -e "  ${VERDE_BRILLANTE}vcscompile testbench_<archivo>.sv${RESET}  - Compila un testbench con VCS completo. Genera testbench_<archivo>_sim"
            echo -e "  ${VERDE_BRILLANTE}vcscompile <archivo>.vcd${RESET}           - Abre un archivo VCD con VERDI/GTKWave"
            echo -e "  ${VERDE_BRILLANTE}vcscompile clean${RESET}                   - Limpia carpetas temporales (bin, log, sim, gtkwave)"
            echo -e "  ${VERDE_BRILLANTE}vcscompile -help${RESET}                   - Muestra esta ayuda\n"

            # echo -e "${CIAN_BRILLANTE}Ejemplos:${RESET}"
            echo -e "Ejemplos:"
            echo -e "  ${AZUL_BRILLANTE}vcscompile packages.sv${RESET}               - Revisa sintaxis del archivo packages.sv"
            echo -e "  ${AZUL_BRILLANTE}vcscompile testbench_top.sv${RESET}          - Compila el testbench_top.sv y genera sim/top_sim"
            echo -e "  ${AZUL_BRILLANTE}vcscompile dump.vcd${RESET}                  - Abre el archivo dump.vcd en VERDI/GTKWave"
            echo -e "  ${AZUL_BRILLANTE}vcscompile clean${RESET}                     - Limpia directorios generados\n"

            echo -e "============================================================\n"
            return 0
        elif [[ "$file" == "clean" ]]; then
            echo -e "${AZUL_BRILLANTE}rm -rf bin gtkwave AN.DB sim log${RESET}"
            rm -rf bin gtkwave AN.DB sim log
            rm -f ucli.key
        else
            echo -e "${ROJO_FONDO}Archivo no admitido:${RESET} ${VERDE_BRILLANTE}$file${RESET}\n"
            return 1
        fi
    fi
}
