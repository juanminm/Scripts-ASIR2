#!/bin/bash

## Cambiar el simbolo del Separador de Campos Interno (IFS o Internal Field
## Separator) de "espacio en blanco" (por defecto) a "salto de linea" (LF o
## line feed) que es el simbolo usado por sistemas basado en Unix para indicar 
## un nuevo salto de linea (CR (carriage return o retorno de carro) para
## MacOS II y CRLF para Windows).
## Esto evita que el bucle for detecte los espacios en los nombres completos
## de usuarios como campos distintos y los muestre en lineas diferentes.
## Tambien se añade un backspace (\b) al final para evitar otros problemas.
IFS=$(echo -en "\n\b")

echo Usuario:Home:Interprete
echo ---------------------------------

## Mediante un bucle for, ejecutar los comandos por cada linea del archivo
## /etc/passwd tras haber sido ordenada.
for usu in $(cat /etc/passwd | sort); do

	## Imprimir por pantalla los campos 1º (nobmre de usuario), 6º (su home) y
	## 7º (interprete) para el valor de $usu
    echo `echo $usu | cut -d ":" -f 1,6,7`
done
