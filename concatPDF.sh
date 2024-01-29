#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Concatena varios pdfs

#files=$(ls *.pdf)

files="A.jpg.pdf B.jpg.pdf C.jpg.pdf D.jpg.pdf 01.jpg.pdf 02.jpg.pdf 03.jpg.pdf 04.jpg.pdf 05.jpg.pdf 06.jpg.pdf 07.jpg.pdf 08.jpg.pdf 09.jpg.pdf E.jpg.pdf F.jpg.pdf"
#for i in $(seq 1 8)
#do
#  n=$(echo $i | awk '{printf("%02d",$1)}')
#  echo page$n.jpg.pdf >> temp.1
#  echo $i.JPG.pdf >> temp.1
#done
#sed ':a;$!N;s/\n/ /;ta;' temp.1 > temp.2
#files=$(cat temp.2)

gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf $files

#rm temp.1 temp.2

#files="01.jpg.pdf  02.jpg.pdf  03.jpg.pdf 04.jpg.pdf 05.jpg.pdf 06.jpg.pdf 07.jpg.pdf  08.jpg.pdf"

#gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.2.pdf $files

#files="F.jpg.pdf G.jpg.pdf H.jpg.pdf"

#g#s -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.3.pdf $files

#files="merged.1.pdf merged.2.pdf merged.3.pdf"

#gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=merged.pdf $files

exit 0
