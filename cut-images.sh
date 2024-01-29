#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Corta uma tira nas imagens png pelo image magick

begin=279
end=310

for i in $(seq $begin $end)
do
 file=orbital-$i
# convert $file.png -crop 0x590 $file.2.png
 mv orbital-$i.2-0.png orbital-$i.png

done

exit

