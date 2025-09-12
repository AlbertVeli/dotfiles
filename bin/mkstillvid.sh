#!/bin/sh
#
# Create a still video from an image and an audio file using ffmpeg.

set -eu

usage() {
  cat <<'EOF'
Usage:
  mkstillvid.sh -i IMAGE -a AUDIO [-o OUTPUT.mp4] [-r 720|1080] [-framerate N] [-crf N] [ffmpeg args...]

Defaults:
  -r 720         (or 1280)
  -framerate 25
  -crf 28
  -c:a aac       (override with -b:a, -ar, etc)

Examples:
  mkstillvid.sh -i cover.png -a song.mp3
  mkstillvid.sh -i cover.png -a song.mp3 -o song1080.mp4 -r 1080 -b:a 256k
EOF
}

IMG=""
AUD=""
OUT=""
RES=720
FPS=25
CRF=28

# Collect extra args for ffmpeg
EXTRA_ARGS=""

# --- Argument parsing ---
while [ $# -gt 0 ]; do
  case "$1" in
    -i) IMG=$2; shift 2 ;;         # input image
    -a) AUD=$2; shift 2 ;;         # input audio
    -o) OUT=$2; shift 2 ;;         # output filename
    -r) RES=$2; shift 2 ;;         # resolution preset (720 or 1080)
    -framerate) FPS=$2; shift 2 ;; # framerate
    -crf) CRF=$2; shift 2 ;;       # video quality (lower = higher quality)
    -h|--help) usage; exit 0 ;;
    *) EXTRA_ARGS="$EXTRA_ARGS $1"; shift ;; # pass everything else to ffmpeg
  esac
done

# --- Sanity checks ---
if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "ffmpeg not found" >&2
  exit 1
fi

if [ -z "$IMG" ] || [ ! -f "$IMG" ]; then
  echo "Image missing or not found: -i IMAGE" >&2
  usage
  exit 1
fi

if [ -z "$AUD" ] || [ ! -f "$AUD" ]; then
  echo "Audio missing or not found: -a AUDIO" >&2
  usage
  exit 1
fi

# If output file not set, derive from audio filename
if [ -z "$OUT" ]; then
  base=$(basename -- "$AUD")
  OUT=${base%.*}.mp4
fi

# Set resolution
case "$RES" in
  720) WIDTH=1280; HEIGHT=720 ;;
  1080) WIDTH=1920; HEIGHT=1080 ;;
  *) echo "Invalid -r (use 720 or 1080)" >&2; exit 1 ;;
esac

# --- Info output ---
echo "Creating video:"
echo "  Image : $IMG"
echo "  Audio : $AUD"
echo "  Out   : $OUT (${WIDTH}x${HEIGHT}, ${FPS}fps, CRF ${CRF})"
if [ -n "$EXTRA_ARGS" ]; then
  echo "  Extra ffmpeg args:$EXTRA_ARGS"
fi

# ffmpeg filter: scale down to fit, then pad with black to exact target size
VF="scale=${WIDTH}:${HEIGHT}:force_original_aspect_ratio=decrease,pad=${WIDTH}:${HEIGHT}:(ow-iw)/2:(oh-ih)/2"

# --- Run ffmpeg ---
ffmpeg \
  -loop 1 -framerate "$FPS" -i "$IMG" -i "$AUD" \
  -c:v libx264 -tune stillimage -pix_fmt yuv420p \
  -vf "$VF" \
  -profile:v baseline -level 3.0 -preset veryfast -crf "$CRF" \
  -c:a aac \
  -shortest -movflags +faststart \
  "$EXTRA_ARGS" \
  "$OUT"

echo "Done: $OUT"
