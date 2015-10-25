#!/bin/bash

## La condición será verdadera si el nombre introducido como parametro existe
## y es un directorio.
if [ -d $1 ]; then
    cd $1
    echo "Enlaces simbolicos:"
    echo "-------------------"
    
    ## Mediante un bucle for, ejecutará las intrucciones dentro para cada
    ## archivo listado mediante un ls dentro del directorio $1.
    for file in $(ls $1); do
    
        ## La condición será verdadera si el archivo existe y si es un enlace
        ## simbólico.
        if [ -h $file ]; then 
        
            ## Imprimir por pantalla el nombre del archivo que es un enlace
            ## simbólico
            echo $file
        fi
    done
else
    ## Imprimir pon pantalla que el archivo no es un directorio o no existe.
    echo "El archivo $1 no es un directorio o no existe."
fi
