#!/bin/sh

IPTABLES_ROOT_CONFDIR="/root/.iptables"

if [ ! -d $IPTABLES_ROOT_CONFDIR ]; then
	mkdir $IPTABLES_ROOT_CONFDIR
fi

case "$1" in
	stop)
		iptables-restore < $IPTABLES_ROOT_CONFDIR/iptables.default
		echo "Restored default configuration."
		;;
	start)
		iptables-restore < $IPTABLES_ROOT_CONFDIR/iptables.conf
		echo "Loaded custom configuration."
		;;
	save)
		iptables-save > $IPTABLES_ROOT_CONFDIR/iptables.conf
		echo "Saved custom configuration."
		;;
	*)
		echo "Usage: /etc/init.d/service_iptables.sh {start|stop|save}"
		exit 1
		;;
esac

exit 0
