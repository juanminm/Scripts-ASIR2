#!/bin/bash

## Para cada nombre de archivo pasados como argumento, mostrar las rutas donde
## se encuentra ese nombre.
for file in $*; do
    locate $file
done
