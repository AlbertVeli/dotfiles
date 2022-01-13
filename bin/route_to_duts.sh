#!/bin/sh

dunkelip=`host wrdc140.westermo.com | cut -d' ' -f4`

# Need sudo
if test "`uname -s`" = "Darwin"; then
    sudo route -n add -net 198.18.0.0/16 $dunkelip
else
    ip route add 198.18.0.0/16 via $dunkelip
fi
