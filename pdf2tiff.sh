#! /bin/bash
file=$1

# remove extensao
s=${file##*/}
s=$(echo ${s%.*})

#convert pdf to tiff OCR
convert -density 300 $1 -depth 8 $s.tiff

# faz o reconhecimento de caracteres em portugues
#tesseract $s.tiff texto -l por
exit 0

