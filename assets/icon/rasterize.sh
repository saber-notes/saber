#!/bin/bash

for svg in *.svg; do
    png="${svg%.*}.png"
    echo "Converting $svg to $png"
    magick "$svg" -resize 1024x1024 -background none -transparent white "$png"
done
