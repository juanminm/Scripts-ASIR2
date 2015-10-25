#!/bin/bash

clear
echo Grupo:GID:Usuarios
echo --------------------------------

## Al igual que en el anterior pero usando los parametrosd '-k 2' y '-t “:”'
## del comando sort:
##     -k 2     Ordena por el campo segundo.
##     -t “:”   Utiliza como delimitador los dos puntos (:)
cat /etc/group | cut -d":" -f 1,3-4 | sort -k 2 -t ":" | more -18
read -p ""
