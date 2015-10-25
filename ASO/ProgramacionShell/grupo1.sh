#!/bin/bash

clear
echo Grupo:GID:Usuarios
echo --------------------------------

## Mediante el comando cut, solo muestra los campos 1 (nombre), 3 (GID) y
## 4 (Usuarios)
cat /etc/group | cut -d":" -f 1,3-4 | sort | more -18
read -p ""