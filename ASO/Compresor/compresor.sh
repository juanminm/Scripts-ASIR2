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
