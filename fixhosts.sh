#!/bin/bash

DATABASE=$HOME/config/known_hosts

while IFS=\; read -r IP HOST
do
	#echo IP=$IP
	#echo HOST=$HOST
	sethosts "$HOST" "$IP" "$@"
done < "$DATABASE"

