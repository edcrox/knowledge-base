#!/bin/bash

#----------------------------------------------------------by Edcrox--------------------------------------------------------------
# Este script busca:
# - Archivos SUID/4000
# - Directorios SGID/2000
# - Archivos y directorios rwx-rwx-rwx/777
# - Archivos y directorios .../.../rwx/007
# - Capabilities 

#Colours by S4vitar, Ty!

greenColour="\\e[0;32m\\033[1m"
endColour="\\033[0m\\e[0m"
redColour="\\e[0;31m\\033[1m"
blueColour="\\e[0;34m\\033[1m"
yellowColour="\\e[0;33m\\033[1m"
purpleColour="\\e[0;35m\\033[1m"
turquoiseColour="\\e[0;36m\\033[1m"
grayColour="\\e[0;37m\\033[1m"

#---------------------------------------------------------------------------------------------------------------------------------

echo -e "\
  ${yellowColour}Este ${endColour}${redColour}script ${endColour}${yellowColour}busca:${endColour}

${greenColour}[+]${endColour} ${grayColour}Archivos${endColour} ${redColour}SUID/4000${endColour}
${greenColour}[+]${endColour} ${grayColour}Directorios${endColour} ${redColour}SGID/2000${endColour}
${greenColour}[+]${endColour} ${grayColour}Archivos y Directorios${endColour} ${redColour}rwx-rwx-rwx/777${endColour}
${greenColour}[+]${endColour} ${grayColour}Archivos y Directorios${endColour} ${redColour}---/---/rwx/007${endColour}
${greenColour}[+]${endColour} ${grayColour}Capabilites${endColour}\
"

#----------------------------------------------------Crear directorio principal---------------------------------------------------

rm -rf /logs/Permisos
mkdir /logs/Permisos

#--------------------------------------------------------Archivos SUID/4000-------------------------------------------------------

find / perm /4000 2>/dev/null > /logs/Permisos/ArSUID
