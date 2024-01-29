#! /bin/bash

pdf2ps $1 temp-1.ps # converte pdf para ps

psnup -m30 temp-1.ps temp-2.ps #aumenta a margem
psbook temp-2.ps temp-3.ps #ordena as paginas
#psnup -s1 -2 temp-2.ps temp-3.ps
#psnup -2 -d1 -b20 temp-3.ps temp-4.ps
psnup -2 -d1 temp-3.ps temp-4.ps
ps2pdf temp-4.ps booklet.pdf

# converte tamanho
#gs -sOutputFile=output.pdf -sDEVICE=pdfwrite -sPAPERSIZE=a5 -dCompatibilityLevel=1.4 -dNOPAUSE -dBATCH -dPDFFitPage input.pdf
