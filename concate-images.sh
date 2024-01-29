#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Concatena varias imagens png lado a lado em uma unica imagem

file1=coeficientes.1.png
file2=coeficientes.2.png

convert $file1 $file2 +append temp.1.png

file3=coeficientes.3.png
file4=coeficientes.4.png

convert $file3 $file4 +append temp.2.png

convert temp.1.png temp.2.png -append temp.png
mv temp.png coeficientes.excitacao.1.png



file1=coeficientes.5.png
file2=coeficientes.6.png

convert $file1 $file2 +append temp.1.png

file3=coeficientes.7.png
file4=coeficientes.8.png

convert $file3 $file4 +append temp.2.png

convert temp.1.png temp.2.png -append -flatten temp.png
mv temp.png coeficientes.excitacao.2.png


file1=coeficientes.9.png
file2=coeficientes.10.png

convert $file1 $file2 +append temp.1.png

file3=coeficientes.11.png
file4=coeficientes.12.png

convert $file3 $file4 +append temp.2.png

convert temp.1.png temp.2.png -append -flatten temp.png
mv temp.png coeficientes.excitacao.3.png


file1=coeficientes.13.png
file2=coeficientes.14.png

convert $file1 $file2 +append temp.1.png

file3=coeficientes.15.png
file4=coeficientes.16.png

convert $file3 $file4 +append temp.2.png

convert temp.1.png temp.2.png -append -flatten temp.png
mv temp.png coeficientes.excitacao.4.png


file1=coeficientes.17.png
file2=coeficientes.18.png

convert $file1 $file2 +append temp.1.png

file3=coeficientes.19.png
file4=coeficientes.20.png

convert $file3 $file4 +append temp.2.png

convert temp.1.png temp.2.png -append -flatten temp.png
mv temp.png coeficientes.excitacao.5.png

rm temp.1.png temp.2.png

exit
