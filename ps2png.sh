#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Converte um conjunto de figuras de ps para png

for i in $(seq 1 20)
do
  convert -density 100 coeficientes.$i.ps coeficientes.$i.png
  convert -rotate 90 coeficientes.$i.png coeficientes.$i.2.png
  mv coeficientes.$i.2.png coeficientes.$i.png
done

exit
