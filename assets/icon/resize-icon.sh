sizes=('16x16' '24x24' '32x32' '48x48' '64x64' '128x128' '256x256' '512x512')

mkdir -p resized

for size in "${sizes[@]}"
do :
    echo "Resizing to $size"
    convert icon.png -resize "${size}" resized/icon-"${size}".png
done

echo "Copying icon to metadata"
cp resized/icon-"${sizes[-1]}".png ../../metadata/en-US/images/icon.png
