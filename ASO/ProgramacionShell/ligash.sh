#!/bin/bash

## La condición será verdadera si el nombre introducido como parametro existe
## y es un directorio.
if [ -d $1 ]; then
    cd $1
    echo "Archivos con enlaces duros:"
    echo "---------------------------"
    
    ## Mediante un bucle for, ejecutará las intrucciones dentro para cada
    ## archivo listado mediante un ls dentro del directorio $1.
    for file in $(ls $1); do
        
        ## La condición será verdadera si el valor del segundo campo del 
        ## listado largo del archivo $file es mayor o igual que dos (2). El 
        ## segundo campo indica el número de archivos que tienen el mismo
        ## inode.
        if [[ $(ls -l $file | tr -s " " | cut -d' ' -f 2) -ge 2 ]]; then 
        
            ## Imprimir el nombre del archivo $file.
            echo $file
        fi
    done
else
    ## Imprimir pon pantalla que el archivo no es un directorio o no existe.
    echo "El archivo $1 no es un directorio o no existe."
fi
