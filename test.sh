#!/usr/bin/env bash

[ $EUID -ne 0 ] && exec sudo -- "$0" "$@"

cp /etc/sysctl.conf /tmp/sysctl.conf
rm /tmp/sysctl.conf

echo "exit"
exit 0



