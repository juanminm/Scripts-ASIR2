#!/bin/bash

## Guardar en la variable $NOM_USU, el quinto campo de la linea del archivo
## /etc/passwd que coincida con el nombre de usuario pasado por parametro.
NOM_USU=$(cat /etc/passwd | grep $1 | cut -d':' -f 5)

## La condición será verdadera si la variable $NOM_USU no está vacía.
if [ ! "$NOM_USU" == "" ]
then

    ## Guardar en la variable $HORA, el resultado del comando `date +"$H$M"`,
    HORA=$(date +"%H%M")
    
    ## Mediante una condición case, mostrará diferentes resultados dependiendo
    ## del contenido de la variable $HORA
    case "$HORA" in
        
        ## Se ejecutará si $HORA está entre 0500 y 1259
        0[5-9][0-5][0-9]|1[0-2][0-5][0-9])
            echo "Buenos días, $NOM_USU"
            ;;
        ## Se ejecutará si $HORA está entre 1300 y 1959
        1[3-9][0-5][0-9])
            echo "Buenas tardes, $NOM_USU"
            ;;
        ## Se ejecutará si $HORA está entre 0000 y 0459 o 2000 y 2359
        0[0-4][0-5][0-9]|2[0-3][0-5][0-9])
            echo "Buenas noches, $NOM_USU"
            ;;
    esac
else
    ## En caso falso, indicar que el usuario no tiene nombre completo.
    echo "El usuario no tiene nombre completo"
fi
