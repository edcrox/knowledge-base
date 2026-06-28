#!/bin/bash

echo "Mi ip privada es --> $(ip a | grep -i "ens33" | tail -n 1 | awk '{print $2}' | awk '{print $1}' FS="/")"
echo 
echo -e "Listo"
