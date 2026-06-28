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

${purpleColour}[+]${endColour} ${grayColour}Archivos${endColour} ${redColour}SUID/4000${endColour}
${purpleColour}[+]${endColour} ${grayColour}Directorios${endColour} ${redColour}SGID/2000${endColour}
${purpleColour}[+]${endColour} ${grayColour}Archivos y Directorios${endColour} ${redColour}rwx-rwx-rwx/777${endColour}
${purpleColour}[+]${endColour} ${grayColour}Archivos y Directorios${endColour} ${redColour}---/---/rwx/007${endColour}
${purpleColour}[+]${endColour} ${grayColour}Capabilites${endColour}\
"

#----------------------------------------------------Crear directorio principal---------------------------------------------------

rm -rf /tmp/Permisos
mkdir -p /tmp/Permisos

#--------------------------------------------------------Archivos SUID/4000-------------------------------------------------------

find / -perm /4000 2>/dev/null > /tmp/Permisos/ArSUID

#------------------------------------------------------Directorios SGID/2000------------------------------------------------------

find / -perm /2000 2>/dev/null > /tmp/Permisos/DirSGID

#---------------------------------------------------Archivos y directorios/777----------------------------------------------------

find / -type f -perm 777 2>/dev/null > /tmp/Permisos/Ar777 
find / -type d -perm 777 2>/dev/null > /tmp/Permisos/Dir777

#---------------------------------------------------Archivos y directorios/007-----------------------------------------------------

find / -type f -perm 007 2>/dev/null > /tmp/Permisos/Ar007
find / -type d -perm 007 2>/dev/null > /tmp/Permisos/Dir007

#----------------------------------------------------------Capabilities------------------------------------------------------------

getcap -r / 2>/dev/null > /tmp/Permisos/CAP

#--------------------------------------------------------------END-----------------------------------------------------------------
echo " "
echo -e "${yellowColour}Logs guardados en carpeta${endColour} ${redColour}tmp${endColour}"
