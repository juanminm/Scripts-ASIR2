#!/bin/bash

menu(
	OPCION=(zenity --list --title="Comprimidor" --radiolist --column="Acción" comprimir descomprimir salir)
	opciones
)

opciones{
	case $OPCION in
		1)
			ARCHIVOS=$(zenity --file-selection --multiple --separator=' ' --title="Selecciona los archivos para comprimir")
			COMPRESION=$(zenity --list --title="Seleccione el tipo de compresión" --radiolist --column="Formato" gzip bzip2 lzip xz)
			case $COMPRESION in
				lzip)
					TIPOCOMP="lzip"
					EXTCOMP=".tar.lz"
					;;
				xz)
					TIPOCOMP="xz"
					EXTCOMP=".tar.xz"
					;;
				bzip2)
					TIPOCOMP="bzip2"
					EXTCOMP=".tar.bz2"
					;;
				gzip)
					TIPOCOMP="gzip"
					EXTCOMP=".tar.gz"
					;;
			esac
			CONTENEDOR=$(zenity --file-selection --save --confirm-overwrite --filename="$EXTCOMP" --title="Seleccione el directorio donde guardar: ")
			tar -vc --${TIPOCOMP} -C $PWD -f ${CONTENEDOR} $ARCHIVOS
			menu
			;;
		2)
			CONTENEDOR=$(zenity --file-selection --title "Seleccione el archivo a descomprimir")
			RUTA=$(zenity -file-selection --directory --title="Seleccione el directorio donde descomprimir")
			tar -xv -C $RUTA -f $CONTENEDOR
			read -p "El archivo `basename $CONTENEDOR` ha sido creado. Pulse ENTER para continuar..."
		menu
			;;
		3)
			echo "Saliendo del programa..."
			exit
			;;
	esac
}

menu