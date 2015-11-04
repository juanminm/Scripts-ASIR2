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

ruta(){
	directorio
	while [ ! -d $RUTA ]; do
		echo "El nombre de directorio no existe o es invalido."
		directorio
	done
}

directorio(){
	if [ $OPCION = 1 ]; then
		read -p "Introduzca la ruta donde guardar el contenedor: " RUTA
	elfi [ $OPCION = 2 ]
		read -p "Introduzca la ruta donde descomprimir el contenedor: " RUTA
	fi
	if [ "`echo "$RUTA" | grep "\/$"`" = "" ]; then
		RUTA="${RUTA}/"
	fi
}

opciones(){
	case $OPCION in
		1)
			read -p "Introduzca las rutas de los archivo que quieres comprimir:" ARCHIVOS
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
			echo "Lo siguientes formatos son soportados:"
			echo "* Gunzip: gz, gzip, gunzip"
			echo "* Bzip2: bz2, bzip2"
			echo "* XZ: xz"
			echo ""
			read -p "Escoge el tipo de compresión [gzip]:" COMPRESION
			case $COMPRESION in
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
			ruta
			tar -vc --${TIPOCOMP} -f ${RUTA}${CONTENEDOR}.${EXTCOMP} $ARCHIVOS
			read -p "El archivo ${CONTENEDOR}.${EXTCOMP} ha sido creado. Pulse ENTER para continuar..."
			menu
			;;
		2)
			read -p "Introduzca la ruta del archivo a descomprimir:" CONTENEDOR
			ruta
			tar -C $RUTA -xvf $CONTENEDOR
			read -p "El archivo `basename $CONTENEDOR` ha sido creado. Pulse ENTER para continuar..."
			menu
			;;
		3)
			echo "Saliendo del programa..."
			exit
			;;
		*)
			menu;;
	esac
}

menu
