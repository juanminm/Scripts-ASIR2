#!/bin/bash

clear
## Ejecuta el script grupo1.sh
bash ./grupo1.sh
echo
## Ejecuta el script grupo2.sh
bash ./grupo2.sh
echo
## Por último, muestra el nombre de host y fecha.
echo "Nombre del host: `cat /etc/hostname`"
echo "Fecha: `date '+%F %T'`"
