#!/bin/sh

app='brave'
id=$(xdotool search --onlyvisible --name brave)

if test "$id" = ""; then
	echo "no brave"
	exit 1
fi

echo "brave id: $id"
echo "moving to (0, 0) 1920x1080"
xdotool windowmove $id 0 0
xdotool windowsize $id 1920 1080
