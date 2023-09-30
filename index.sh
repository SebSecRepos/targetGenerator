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

tabs=('Nmap' 'Content' 'Exploits' 'Routes' 'ReverseTCP')

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


    for folder in $tabs; do

        tabs=$(kitty @ ls)
        exist=$(echo "$tabs" | grep "$folder")

    #Evaluar si existe la ventana
        if [[ $exist ]]; then   

            echo -e "\n[!] La ventana $folder existe ¿Quiere crearla nuevamente? ${greenColour}<y> ${redColour}${endColour}<n>\n"

    #Evaluar opción 
            while [[ "$opt" != "y" ]] && [[ "$opt" != "n" ]]; do 
                read opt

                if [[ "$opt" == "y" ]]; then
                    mkdir "$1/Targets/$#folder" 2>/dev/null
                    tabId="$(kitty @ launch --type=tab --tab-title "$folder" "$1/Targets/$folder" --keep-focus zsh)"
                else
                    echo -e "Opción inválida"
                    read opt  #Leer hasta que sea correcta
                fi
            done

        else
            mkdir "$1/Targets/$folder" #2>/dev/null
            tabId="$(kitty @ launch --type=tab --tab-title "$folder" "$1/Targets/$folder" --keep-focus zsh)"
        fi
    done

}


# Main
if [[ -e "$1/Targets" ]]; then
    echo -e "\n ${redColour}[!]${yellowColour}La carpeta ya existe allí ¿Desea eliminarla y continuar? ${greenColour}<y> ${redColour}<n>${endColour}"

    while [[ "$opt1" != "y" ]] && [[ "$opt1" != "n" ]]; do 
            read opt1
            if [[ "$opt1" == "n" ]]; then
                ctrl_c
            elif [[ "$opt1" == "y" ]]; then
                remove_tabs 
                rm -rf "$1/Targets"
                execute $1
            else
                echo -e "Opción inválida"
                read opt1  #Leer hasta que sea correcta
            fi
        done
else
    execute $1
fi





