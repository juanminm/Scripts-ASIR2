#!/bin/bash

menu(){
	clear
	echo "-------------------------"
	echo "|    Script compresor   |"
	echo "-------------------------"
	echo "1. Comprimir"
	echo "2. Descomprimir"
	echo "3. Salir"

	read -p "Selecciona una opción: " OPCION
	opciones
}

opciones(){
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
					echo "  $OMITIDO"
					ARCHIVOS=`echo "$ARCHIVOS" | sed "s/$OMITIDO//g"`
				done
				echo "Se omitirán."
			fi
			echo $ARCHIVOS
			read -p "Escoge el tipo de compresión [gz, gzip]:" COMPRESION
			case $COMPRESION in
				lz|lzip)
					TIPOCOMP="lzip"
					EXTCOMP="tar.lz"
					;;
				xz)
					TIPOCOMP="xz"
					EXTCOMP="tar.xz"
					;;
				bz2|bzip2)
					TIPOCOMP="bzip2"
					EXTCOMP="tar.bz2"
					;;
				gz|gzip|gunzip|ungzip|"")
					TIPOCOMP="gzip"
					EXTCOMP="tar.gz"
					;;
			esac
			read -p "Introduzca el nombre del contenedor: " CONTENEDOR
			tar -vc --${TIPOCOMP} -f ${CONTENEDOR}.${EXTCOMP} $ARCHIVOS
			read -p "El archivo ${CONTENEDOR}.${EXTCOMP} ha sido creado. Pulse ENTER para continuar..."
			menu;
			;;
		2)
			read -p "Introduzca la ruta del archivo a descomprimir:" CONTENEDOR
			read -p "¿Dónde desea descomprimirlo?:" RUTA
			tar -C $RUTA -xvf $CONTENEDOR
			read -p "El archivo `basename $CONTENEDOR` ha sido creado. Pulse ENTER para continuar..."
			menu;
			;;
		3)
			echo "Saliendo del programa..."
			exit
			;;
		*)
			menu;
	esac
}

menu
