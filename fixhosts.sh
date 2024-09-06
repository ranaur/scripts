#!/bin/bash
#
# Reads the data on database ~/config/knownhosts , a ";" separated values od IPs and Hosts and sets /etc/hosts
#
#
DATABASE=$HOME/config/known_hosts

while IFS=\; read -r IP HOST
do
	#echo IP=$IP
	#echo HOST=$HOST
	sethosts "$HOST" "$IP" "$@"
done < "$DATABASE"

