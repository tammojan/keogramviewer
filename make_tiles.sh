#!/bin/bash

input=../2025_yearly_fullres.png
xpix=$(identify -format '%w' "$input")
ypix=$(identify -format '%h' "$input")

for level in {0..9}; do
    mkdir -p tiles/$level
    scale=$((2**$level))
    convert $input -scale 1440x$((${ypix}/$scale))\! -crop 1440x1024 +repage tiles/${level}/%d.jpg
done

