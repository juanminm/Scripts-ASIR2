#!/bin/bash

## Si el nombre pasado por argumento es un directorio, mostrar los directorios
## recursivamente.
if [ -d $1 ]; then
    ls -R $1 | grep | pr -l 23 | more
fi
