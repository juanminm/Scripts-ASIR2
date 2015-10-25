#!/bin/bash

## Guardar como vacia la variable $SECGRUPOS.
SECGRUPOS=''

## Guardar en la variable $USU la salida de la linea del comando cat en el
## archivo /etc/passwd tras haber coincidido con el usuario pasado como
## parametro.
USU=`cat /etc/passwd | grep $1`

## Para que la condición sea verdadera, la variable $NOMUSER NO debe estar
## vacia. Si lo está, mostrará que el usuario no existe.
if [ ! $NOMUSER = '' ]; then
    
    ## Guardar el campo del nombre de usuario en la variable $NOMUSU
    NOMUSU=`echo $USU | cut -d ":" -f 1`
    
    ## Mostrar el nombre de usuario mediante un echo de la variable $NOMUSU.
    echo "Nombre de usuario: `echo $NOMUSU`"
    
    ## Mostrar el UID mediante un cut del campo uno de la variable $USU.
    echo "UID: `echo $USU | cut -d ":" -f 3`"
    
    ## Guardar el campo de grupo principal en la variable $PRINCGRUPO
    PRINCGRUPO=`echo $USU | cut -d ":" -f 4`
    
    ## Mostrar el grupo principal mediante un echo a la variable $PRINCGRUPO.
    echo "Grupo principal: `echo $PRINCGRUPO`"
    
    ## Crear un bucle for con la variable $SECGROUP, donde la variable
    ## $SECGRUPO contendrá cada grupo que contenga el contenido de la
    ## variable $NOMUSU.
    for SECGRUPO in $(cat /etc/group | grep $NOMUSU); do

        ## La condición será verdadera si la variable $SECGROUP no es igual a
        ## la variable $PRINCGRUPO. Esto eliminará que se muestre tanto en
        ## “Grupo principal” como en “Grupos secundarios”.
        if [ ! $SECGRUPO = $PRINCGRUPO ]; then

            ## Si la variable $SECGRUPOS está vacía, simplemente se añadirá
            ## el contennido de la variable $SECGRUPO. Si no lo es, se
            ## concatenará separando cada grupo por una coma y un espacio.
            if [ $SECGRUPOS = '' ]; then
                $SECGRUPOS="$SECGRUPO"
            else
                $SECGRUPOS="$SECGRUPOS, $SECGRUPO"
            fi
        fi
    done
    
    ## Si la variable $SECGRUPOS no está vacia, mostrará la lista de grupos
    ## secundarios. Si está vacia, mostrará "Ninguno".
    if [ ! $SECGRUPOS = '' ]; then
        echo "Grupos secundarios: `echo $SECGRUPOS`"
    else
        echo "Grupos secundarios: Ninguno."
    fi
else
    echo "El usuario no existe."
fi
