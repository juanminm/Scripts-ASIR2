#!/bin/bash

## Asignar el valor 0 a la variable $COUNTER
COUNTER=0

## Si el directorio ~/bin no existe, crear el directorio.
if [ -d ~/bin ]; then
    mkdir -p ~/bin
fi

## Para cada archivo de extensiones .sh, .bash, .csh, .zsh y .dash del
## directorio actual obtenidos mediante un ls, moverlos a ~/bin y mostrar por
## pantalla la acción. Además, aumentar por uno (1) la variable $COUNTER.
for file in $(ls *.sh *.bash *.csh *.zsh *.dash); do
    mv $file ~/bin
    echo "$file ha sido movido a ~/bin"
    COUNTER=$COUNTER+1
done 

## Si la variable $COUNTER es mayor que cero (0), mostrará el contador, que es
## el número de archivos movidos. Si es cero, indicará que no se movió ningun
## archivo.
if [ $COUNTER -gt 0 ]; then
    echo "Se han movido $COUNTER programas a ~ /bin"
else
    echo "No se ha movido ningun archivo."
fi
