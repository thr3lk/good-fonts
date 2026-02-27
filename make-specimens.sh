#!/usr/bin/env bash

SIZE=1000x1000
POSITION="+0+0"
FONT_SIZE=38
BG_COLOR="#ffffff"
FG_COLOR="#0074D9"

SPECIMEN_TEXT="ABCDEFGHIJKLM\nNOPQRSTUVWXYZ\nabcdefghijklm\nnopqrstuvwxyz\n1234567890\n!@$\%(){}[]\nالسلام عليكم"

# list of fonts as names in local ImageMagick library
# @todo: fix this to be more flexible and dynamic
fonts=(
Poppins
YoungSerif
InputMono
)

generate_preview(){
    magick -size "$SIZE" xc:"$BG_COLOR" \
    -fill "$FG_COLOR" \
    -font "$2" \
    -pointsize 80 \
    -gravity center \
    -annotate +0+0 "$1" \
    "$3"
}

for i in "${fonts[@]}"; do
    echo "$i"
    generate_preview "$SPECIMEN_TEXT" "$i" "specimens/${i}-preview.png"
done


exit 0
