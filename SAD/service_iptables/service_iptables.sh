#!/bin/bash

case $1 in 
	stop) iptables-restore < default_ipt.sh;;
	start) iptables-restore < iptables.conf;;
	save) iptables-save > iptables.conf;;
	*) 
		echo "service_iptables ACCION"
		echo "    start:  Restablec la configuracion guardada."
		echo "     stop:  Restablece la configuración por defecto"
		echo "     save:  Guarda la configuración"
		echo "     help:  Muestra la ayuda"
		;;
esac

