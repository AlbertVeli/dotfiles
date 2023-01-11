#!/bin/sh

# Video codec for encoding. You might change this
# if your ffmpeg does not support libx264. But
# this setting gives best quality.
vcodec='-vcodec libx264 -preset ultrafast -qp 0'

if ! which ffmpeg >/dev/null; then
    echo "install ffmpeg first"
fi

# Choose audio with pulse
snd='-an'
#snd='-f pulse'
width=1920
height=1080

# Make sure width is divisible by 2
width=$((${width} - $((${width} % 2))))

# ffmpeg may or may not work with the x11grab option, it depends on the platform and compile time flags
#CMD="ffmpeg -f x11grab -r 25 -s ${width}x${height} -i :0.0 $snd -i default $vcodec output.mkv"
CMD="ffmpeg -video_size ${width}x${height} -framerate 25 -f x11grab -i :0.0 $snd $vcodec output.mkv"

echo "CMD = $CMD"
exec $CMD
