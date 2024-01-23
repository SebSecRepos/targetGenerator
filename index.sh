#!/usr/bin/zsh

#Global variables
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

tabs=('Command' 'Nmap' 'Content' 'Exploits' 'Routes' 'ReverseTCP')

# Helpanel
if [[ ! $1 ]] || [[ "$1" == "-h" ]] ; then
    echo -e "${greenColour}\n[+]${yellowColour} <<============ Ayuda ============>>${endColour}\n"
    echo -e "${yellowColour}\t${blueColour}*${yellowColour} Uso:  ${greenColour}tarGen ${redColour}<Ruta absoluta> (Ruta de target folder) ${endColour}\n"
    exit 0
fi
#ctrl_c
function ctrl_c(){
    echo -e "\n${redColour} [!] Saliendo... ${endColour}\n"
    exit 1
}
trap ctrl_c INT


function remove_tabs(){
    for tab in $tabs; do
        kitty @ close-tab --match "title:$tab" 2>/dev/null
    done
}


function execute(){

    mkdir "$1/Targets" 2>/dev/null

    echo -e "\n ${blueColour}Ingrese la ip de los objetivos separados por espacio:${endColour}\n"

    read ips

    # Crear un array a partir de la cadena de texto
    array=("${(s: :)ips}")

    for folder in $tabs; do

        mkdir "$1/Targets/$folder" 2>/dev/null
        
        for tar in "${array[@]}"; do
            mkdir "$1/Targets/$folder/$tar" 2>/dev/null
        done

        tabId="$(kitty @ launch --type=tab --tab-title "$folder" "$1/Targets/$folder" --keep-focus zsh)"
    
    done

}

function execute2(){
 

    for folder in $tabs; do
        tabId="$(kitty @ launch --type=tab --tab-title "$folder" "$1/Targets/$folder" --keep-focus zsh)"
    done

}


# Main
if [[ -e "$1/Targets" ]]; then
    echo -e "\n ${redColour}[!]${endColour} La carpeta ya existe allí \n\n\t ${greenColour} <y>${yellowColour} ¿Desea eliminarla y continuar? \n\t  ${redColour}<n>${yellowColour} Salir \n\t ${blueColour} <a> ${yellowColour}Crear ventanas en la misma carpeta"

    while [[ "$opt1" != "y" ]] && [[ "$opt1" != "n" ]] && [[ "$opt1" != "a" ]]; do
            read opt1

            if [[ "$opt1" == "n" ]]; then
                ctrl_c

            elif [[ "$opt1" == "y" ]]; then
                remove_tabs
                rm -rf "$1/Targets"
                execute $1

	    elif [[ "$opt1" == "a" ]]; then
                remove_tabs
                execute2 $1
            else
                echo -e "Opción inválida"
                read opt1  #Leer hasta que sea correcta
            fi
        done
else
    remove_tabs
    execute $1
fi





