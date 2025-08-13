#!/bin/bash

for svg in *.svg; do
    png="${svg%.*}.png"
    echo "Converting $svg to $png"
    rsvg-convert -o "$png" "$svg" -w 1024 -h 1024
done
