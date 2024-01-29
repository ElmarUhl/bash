#! /bin/bash
# Autor: Elmar de Oliveira Uhl
# O script obtem os autovalores do arquivos mos do turbomole e coloca no formato
# para leitura do script do R

grep eigenvalue mos > eigenvalues.txt

#cat eigenvalues.txt | cut -c -6 > temp.1
#cat eigenvalues.txt | cut -c 7-10 > temp.2
#cat eigenvalues.txt | cut -c 27- > temp.3

awk '{printf("%s %s\n",$1,$2)}' eigenvalues.txt > temp.1
awk '{printf("%s\n",$3)}' eigenvalues.txt > temp.2
sed 's/eigenvalue=//' temp.2 > temp.3
paste temp.1 temp.3 > temp.4
sed 's/D/e/' temp.4 > temp.5

cat temp.5

rm temp.1 temp.2 temp.3 temp.4 temp.5 eigenvalues.txt

exit

awk '{printf("%6d %3s %s\n",$1,$2,$3)}' temp.5 > temp.6
sort -n temp.6 > temp.7
cat temp.7 | cut -c -19 > temp.8
cat temp.7 | cut -c 20-23 > temp.9
cat temp.7 | cut -c 24- > temp.10
paste temp.9 temp.10 temp.8 > temp.11
awk '{printf("%3d %s %19.14f\n", $1, $2, $3)}' temp.11 > temp.12
cat temp.12
mv temp.12 orbitais-ordenados.txt

#rm temp.1 temp.2 temp.3 temp.4 temp.5 temp.6 temp.7 temp.8 temp.9  temp.10 temp.11
