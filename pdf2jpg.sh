#! /bin/bash
file=$1

#convert pdf to jpg
convert -density 200 $1 merge.jpg

exit 0

