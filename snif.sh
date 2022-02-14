#!/bin/bash
set -x

ACTION=$1
[ -z $ACTION ] && ACTION=run

[ -z $SNIF_DIR ] && SNIF_DIR=/var/log/snif
mkdir -p $SNIF_DIR

[ -z $SNIF_INTERFACE ] && SNIF_INTERFACE=eth0

run() {
	current_pid=$(ps -C tcpdump | awk '/tcpdump/ { print $1 }')
	[ -z $current_pid ] || sudo kill $current_pid 

	my_ip=$(ifconfig ${SNIF_INTERFACE} | awk '/inet[^0-9]/ { print $2; }')
	filename=${SNIF_DIR}/snif-%Y%m%dT%H%M%S.pcap
	capture_size=1000
	filter="not net ${my_ip}"

	tcpdump -i ${SNIF_INTERFACE} -c ${capture_size} -G 1800 -w ${filename} ${filter}
}

$ACTION
