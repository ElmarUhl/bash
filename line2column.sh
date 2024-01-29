# Autor: Elmar de Oliveira Uhl
# converte linhas em colunas e concatena
#! /bin/bash

cat $1 | awk 'NR % 2 == 1 {print " "$0}' > temp1 # imprime linhas impares
cat $1 | awk 'NR % 2 == 0 {print " "$0}' > temp2 # imprime linhas pares

sed ':a;$!N;s/\n//;ta;' temp1 > temp3 # concatena linhas
sed ':a;$!N;s/\n//;ta;' temp2 > temp4

sed 's/[ ]\+/ /g' temp3 > temp5 # remove espacos duplos
sed 's/ /&\n/g' temp5 > temp6 # substitui espacos por nova linha

sed 's/[ ]\+/ /g' temp4 > temp7 # remove espacos duplos
sed 's/ /&\n/g' temp7 > temp8

paste temp6 temp8 > temp9 # concatena os arquivos em colunas
cat temp9 | awk '{print $1 $2 " "}' > temp10 # remove os espacos entre colunas

sed ':a;$!N;s/\n//;ta;' temp10

rm temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8 temp9 temp10
exit 0 

