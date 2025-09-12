#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  mkstillvid.sh -i IMAGE -a AUDIO [-o OUTPUT.mp4] [-r 720|1080] [ffmpeg args...]

Defaults:
  -res 720        (choose 1080 for HD)
  -framerate 25
  -crf 28
  -c:a aac      (override with -b:a, -ar, etc.)

Example:
  mkstillvid.sh -i stillimage.png -a audio.mp3 -o out.mp4 -res 1080 -b:a 256k -ar 48000
EOF
}

# Defaults
IMG=""
AUD=""
OUT=""
RES=720
FPS=25
CRF=28

# Extra ffmpeg args
EXTRA_ARGS=()

while (($#)); do
  case "$1" in
    -i) IMG="${2:-}"; shift 2;;
    -a) AUD="${2:-}"; shift 2;;
    -o) OUT="${2:-}"; shift 2;;
    -res) RES="${2:-}"; shift 2;;
    -framerate) FPS="${2:-}"; shift 2;;
    -crf) CRF="${2:-}"; shift 2;;
    -h|--help) usage; exit 0;;
    *) EXTRA_ARGS+=("$1"); shift;;
  esac
done

command -v ffmpeg >/dev/null || { echo "ffmpeg not found" >&2; exit 1; }
[[ -n "$IMG" && -f "$IMG" ]] || { echo "No image: -i IMAGE" >&2; usage; exit 1; }
[[ -n "$AUD" && -f "$AUD" ]] || { echo "No audio: -a AUDIO" >&2; usage; exit 1; }

if [[ -z "$OUT" ]]; then
  base="$(basename "$AUD")"
  OUT="${base%.*}.mp4"
fi

case "$RES" in
  720) WIDTH=1280; HEIGHT=720;;
  1080) WIDTH=1920; HEIGHT=1080;;
  *) echo "Invalid -res (use 720 or 1080)"; exit 1;;
esac

echo "Creating video:"
echo "  Imgage : $IMG"
echo "  Audio  : $AUD"
echo "  Output : $OUT (${WIDTH}x${HEIGHT}, ${FPS} fps, CRF $CRF)"
echo "  Extra ffmpeg args: ${EXTRA_ARGS[*]:-(none)}"

ffmpeg \
  -loop 1 -framerate "$FPS" -i "$IMG" -i "$AUD" \
  -c:v libx264 -tune stillimage -pix_fmt yuv420p \
  -vf "scale=${WIDTH}:${HEIGHT}:force_original_aspect_ratio=decrease,pad=${WIDTH}:${HEIGHT}:(ow-iw)/2:(oh-ih)/2" \
  -profile:v baseline -level 3.0 -preset veryfast -crf "$CRF" \
  -c:a aac \
  -shortest -movflags +faststart \
  "${EXTRA_ARGS[@]}" \
  "$OUT"

echo "Done: $OUT"
