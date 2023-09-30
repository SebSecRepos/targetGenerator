#!/bin/bash

if [[ "$(whoami)" != "root" ]]; then

    echo "[+] Must be root"
    exit 1
fi

mkdir /opt/targetGenerator/

cp ./index.sh /opt/targetGenerator/tarGen.sh

ln -s /opt/targetGenerator/tarGen.sh /usr/bin/tarGen 