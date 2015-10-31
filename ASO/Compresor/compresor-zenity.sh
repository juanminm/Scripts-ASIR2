#!/bin/bash

menu(){
	OPCION=$(zenity --list --title="Comprimidor" --radiolist --column="" --column="Acción" "" "Comprimir" "" "Descomprimir" "" "Salir")
	opciones
}

opciones(){
	case $OPCION in
		"Comprimir")
			ARCHIVOS=$(zenity --file-selection --multiple --separator=' ' --title="Selecciona los archivos para comprimir")
			COMPRESION=$(zenity --list --title="Seleccione el tipo de compresión" --radiolist --column="" --column="Formato" "" gzip "" bzip2 "" xz)
			case $COMPRESION in
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
			tar -vc --${TIPOCOMP} -f ${CONTENEDOR} $ARCHIVOS
			zenity --info --text="El archivo `basename $CONTENEDOR` ha sido creado."
			menu
			;;
		"Descomprimir")
			CONTENEDOR=$(zenity --file-selection --title "Seleccione el archivo a descomprimir")
			RUTA=$(zenity --file-selection --directory --title="Seleccione el directorio donde descomprimir")
			tar -xv -C $RUTA -f $CONTENEDOR
			zenity --info --text "El archivo `basename $CONTENEDOR` ha sido descomprimido."
		menu
			;;
		"Salir")
			echo "Saliendo del programa..."
			exit
			;;
	esac
}

menu
