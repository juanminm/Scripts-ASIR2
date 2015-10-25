#!/bin/bash

## Guardar en la variable $GRUPO la salida de la linea del archio /etc/group
## que coincida con el nombre de grupo pasado por parametro
GRUPO=$(cat /etc/group | grep $1)

## La condición será verdadera, si la variable $GRUPO NO está vacia.
if [ ! $GRUPO = '' ]; then
    
    ## Mostrar el campo primero de la variable $GRUPO que contiene el nombre
    ## del grupo.
    echo "Nombre del grupo: `echo $GRUPO | cut -d ":" -f 1`"
    
    ## Mostrar el campo tercero de la variable $GRUPO que contiene el GID del
    ## grupo.
    echo "GID: `echo $GRUPO | cut -d ":" -f 3`"
    
    ## Mostrar el campo cuarto de la variable $GRUPO que contiene los usuarios
    ## del grupo.
    echo "Usuarios: `echo $GRUPO | cut -d ":" -f 4`"
else
    ## Indicar que el usuario no existe, en caso falso.
    echo "El grupo no existe."
fi
