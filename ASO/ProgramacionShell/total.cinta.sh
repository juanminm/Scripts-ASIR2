#!/bin/bash

## Guardar en la variable $TOTAL, el valor 0.
TOTAL=0

## Mediante un bucle for, guardar en la variable $FSIZE el cuarto campo (numero
## de bytes) separado por espacios del archivo respaldo.error.
for FSIZE in $(cat respaldo.error | cut -d' ' -f4); do
	
	## Guardar en la variable $TOTAL, la suma entre $TOTAL y $FISE.
	TOTAL=$((TOTAL + FSIZE))
done

## Mostrar el valor en bytes.
echo "Total de bytes respaldados: $TOTAL"
## Mostrar el valor en Megabytes binarios o Mebibytes (MiB).
echo "Total de Mebibytes respaldados: `expr $TOTAL / 1024**2`MiB"
## Mostrar el valor en Gigabytes binarios o Gibibytes (GiB).
echo "Total de Gibibytes respaldados: `expr $TOTAL / 1024**3`GiB"

