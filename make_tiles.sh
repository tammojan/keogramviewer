#!/bin/bash

input=../2025_yearly.png #yearlong_keogram.png
xpix=1440
ypix=18250 #329400

for level in {0..8}; do
    mkdir -p tiles/$level
    scale=$((2**$level))
    convert $input -scale 1440x$((${ypix}/$scale))\! -crop 1440x1024 +repage tiles/${level}/%d.jpg
done

