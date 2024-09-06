#!/bin/bash
#
# Set hostname on /etc/hosts files (or any othr file passed as thiurd parameter)
#
# Example: sethosts router 192.168.0.1 
#

if grep -q WSL /proc/version ; then
	HOSTS_FILE=${3:-/c/Windows/System32/drivers/etc/hosts}
else
	HOSTS_FILE=${3:-/etc/hosts}
fi

HOST=${1}
IP=${2}

if [ -z "$IP" ] ; then
	echo usage: $0 HOST IP [hosts file]
	exit -1
fi

if [ `id -u` -ne 0 ] ; then
	echo Elevating priviledges.
	echo sudo $0 "$@"
	sudo $0 "$@"
	exit $?
fi

#echo grep -iq "[[:space:]]$HOST" $HOSTS_FILE
grep -iq "$HOST" $HOSTS_FILE
HAS_LINE=$?

#echo HAS_LINE = $HAS_LINE
if [ $HAS_LINE = 0 ] ; then
	SED_COMMAND="s/.*[ \t]$HOST/$IP $HOST/i"
	sed -i -e "$SED_COMMAND" $HOSTS_FILE
else
	#cat $HOSTS_FILE
	#echo "$IP $HOST"
	echo "$IP $HOST" >> $HOSTS_FILE
fi

exit 0
