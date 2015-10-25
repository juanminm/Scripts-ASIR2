#!/bin/bash

## Si el nombre pasado como argumento existe, añadir el permiso de ejecución
## para usuario y grupo.
if [ -f $1 ]; then
    chmod ug+x $1 
fi
