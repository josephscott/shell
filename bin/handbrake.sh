#!/bin/bash

HB="/usr/local/bin/HandBrakeCLI"
SRC_DIR="/Volumes/bare-ssd-01/mkv"
DST_DIR="/Volumes/bare-ssd-01/mp4"

# Create destination directory if it doesn't exist
mkdir -p "$DST_DIR"

for input in "$SRC_DIR"/*.mkv; do
    # Skip if no files match
    [[ -e "$input" ]] || continue

    filename=$(basename "$input")
    base="${filename%.*}"
    output="$DST_DIR/$base.mp4"

    echo "Encoding: $input"
    echo "Output:   $output"

    "$HB" \
        -i "$input" \
        -o "$output" \
        --preset="HQ 1080p30 Surround" \
        --audio-lang-list eng \
        --all-audio \
        --audio-copy-mask aac,ac3,eac3,dtshd,dts,flac,mp3 \
        --audio-fallback aac \
        --drc 2 \
        --all-subtitles \
        --subtitle-lang-list eng \
        --subtitle=scan \
        --subtitle-forced \
        --subtitle-burned=foreign

    echo "Finished: $output"
    echo "--------------------------------------"
done
