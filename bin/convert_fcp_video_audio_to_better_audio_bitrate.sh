#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input-video> <input-audio> <output-video>"
    exit 1
fi

IN_VIDEO="$1"
IN_AUDIO="$2"
OUT_VIDEO="$3"

# Check if input files exist
if [ ! -f "$IN_VIDEO" ]; then
    echo "Error: video file '$IN_VIDEO' does not exist."
    exit 1
fi

# Check if input audio exists
if [ ! -f "$IN_AUDIO" ]; then
    echo "Error: audio file '$IN_AUDIO' does not exist."
    exit 1
fi

# Run ffmpeg command to replace audio without re-encoding the video
ffmpeg -i "$IN_VIDEO" -i "$IN_AUDIO" \
  -map 0:v:0 -map 1:a:0 \
  -c:v copy -c:a aac -b:a:0 192k \
  -shortest -movflags +faststart \
  -map_metadata 0 -metadata:s:a:0 language=eng \
  "$OUT_VIDEO"
