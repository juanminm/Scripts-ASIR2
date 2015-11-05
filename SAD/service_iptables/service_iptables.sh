#!/bin/bash

case "$1" in
	stop)
		iptables-restore < iptables.default
		echo "Restored default configuration."
		;;
	start)
		iptables-restore < iptables.conf
		echo "Loaded custom configuration."
		;;
	save)
		iptables-save > iptables.conf
		echo "Saved custom configuration."
		;;
	*)
		echo "Usage: /etc/init.d/service_iptables.sh {start|stop|save}"
		exit 1
		;;
esac

exit 0
