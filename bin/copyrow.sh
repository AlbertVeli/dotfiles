#!/bin/sh

usage()
{
cat << EOF
Usage: ${0##*/} <FILE> <ROW>
Copy ROW from FILE and put in clipboard.
EOF
}

fail()
{
    echo "$1"
    exit 1
}

if [ "$#" != "2" ]; then
    usage
    exit 1
fi


FNAME=$1
ROW=$2

if test "`uname -s`" = "Darwin"; then
	CP='pbcopy'
else
	CP='xclip -selection c'
fi

if ! test -f $FNAME; then
	if test "`mount | grep fuse | grep encfs`" = ""; then
		~/Dropbox/mount.sh
	fi
fi
if ! test -f $FNAME; then
	fail "Can not find file $FNAME"
fi

head -${ROW} $FNAME | tail -1 | tr -d '\n' | $CP || \
fail "Failed to copy row, is xclip installed?"

echo "Row ${ROW} from ${FNAME} is now in clipboard"
