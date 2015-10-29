#!/bin/bash

clear
echo "-------------------------"
echo "|    Script compresor   |"
echo "-------------------------"
echo "1. Comprimir"
echo "2. Descomprimir"
echo "3. Salir"

read -p "Selecciona una opción: " OPCION

case $OPCION in
	1)
		read -p "Introduzca las rutas de los archivo que quieres comprimir:" ARCHIVOS
		echo $ARCHIVOS
		for TEST in $ARCHIVOS; do
			if [ ! -f $TEST ]; then
				INVALIDO="$INVALIDO $TEST"
			fi
		done
		if [ ! "$INVALIDO" = '' ]; then
			echo Las siguientes rutas no existen o son invalidas:
			for OMITIDO in $INVALIDO; do
				echo "\ \ $OMITIDO"
				ARCHIVOS=`echo "$ARCHIVOS" | sed "s/$OMITIDO//g"`
			done
			echo "\nSe omitirán."
		fi
		echo $ARCHIVOS
		read -p "Escoge el tipo de compresión (gz, bz, lz, xz) [gz]:" TIPOCOMPRESION

		read -p "Introduzca el nombre del contenedor: " CONTENEDOR
		tar -zvcf $CONTENEDOR $ARCHIVOS
		;;
	2)
		read -p "Introduzca la ruta del archivo a descomprimir:" CONTENEDOR
		read -p "¿Dónde desea descomprimirlo?:" RUTA
		tar -C $RUTA -xvf $CONTENEDOR
		;;
	3)
		echo "Saliendo del programa..."
		exit
		;;
esac
