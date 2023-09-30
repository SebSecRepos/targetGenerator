#!/bin/bash

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


if [[ "$(whoami)" != "root" ]]; then

    echo -e "\n${redColour}[!] Ejecutar como root\n${endColour}"
    exit 1
fi

mkdir /opt/targetGenerator/ 2>/dev/null

if [[ $? -ne 0 ]]; then

    rm -rf /opt/targetGenerator/ 2>/dev/null
    rm /usr/bin/tarGen 2>/dev/null
    mkdir /opt/targetGenerator/
    cp ./index.sh /opt/targetGenerator/tarGen.sh
    ln -s /opt/targetGenerator/tarGen.sh /usr/bin/tarGen 

else
    cp ./index.sh /opt/targetGenerator/tarGen.sh
    ln -s /opt/targetGenerator/tarGen.sh /usr/bin/tarGen 
fi

echo -e "\n${greenColour}[+] ¡tarGen instalado! Ejecute: ${yellowColour}tarGen ${redColour}<ruta absoluta>\n${endColour}"

