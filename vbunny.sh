#!/bin/sh

set -eu

usage() {
    echo "Usage: $0 -i input_ext -o output_ext [-d directory] [-f prefix]"
    exit 1
}

DIR="."
PREFIX=""
IN_EXT=""
OUT_EXT=""

while getopts "d:i:o:f:" opt; do
    case "$opt" in
        d) DIR=$OPTARG ;;
        i) IN_EXT=$OPTARG ;;
        o) OUT_EXT=$OPTARG ;;
        f) PREFIX=$OPTARG ;;
        *) usage ;;
    esac
done

[ -n "$IN_EXT" ] || usage
[ -n "$OUT_EXT" ] || usage

# normalize extensions (remove leading dot if provided)
IN_EXT=${IN_EXT#.}
OUT_EXT=${OUT_EXT#.}

count=1

# handle no matches safely
found=false

for file in "$DIR"/*."$IN_EXT"; do
    [ -e "$file" ] || continue
    found=true

    base=$(basename "$file")
    name=${base%.*}

    if [ -n "$PREFIX" ]; then
        out="${DIR}/${PREFIX}${count}.${OUT_EXT}"
        count=$((count + 1))
    else
        out="${DIR}/${name}.${OUT_EXT}"
    fi

    echo "Converting: $file -> $out"
    ffmpeg -y -i "$file" "$out"
done

if [ "$found" = false ]; then
    echo "No *.$IN_EXT files found in $DIR"
fi