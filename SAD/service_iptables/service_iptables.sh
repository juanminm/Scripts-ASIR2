#!/bin/bash

case $1 in 
	stop)
		iptables-restore < default_ipt.sh;;
	start)
		iptables-restore < iptables.conf;;
	save)
		iptables-save > iptables.conf;;

