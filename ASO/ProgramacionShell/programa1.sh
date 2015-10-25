#!/bin/bash

## Guardar los caracteres 2º al 4º del comando ls -l a la variable $permisos.
permisos=`ls -l $1 | cut -c 2-4`

## Mediante un bucle 'case' mostrar distintos resultados.
case $permisos in
    "r--") echo "El archivo es legile por el usuario.";;
    "-w-") echo "El archivo es modificable por el usuario.";;
    "--x") echo "El archivo es ejecutable por el usuario.";;
    "rw-") echo "El archivo es legible y modificable.";;
    "r-x") echo "El archivo es legible y ejecutable.";;
    "-wx") echo "El archivo es modificable y ejecutable.";;
    "rwx") echo "El usuario tiene control total.";;
esac
