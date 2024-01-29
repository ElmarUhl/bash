#! /bin/bash

file=$1

convert $file -resize 1200x1200 temp.png

mv temp.png $file

exit 0
