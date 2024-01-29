#! /bin/bash

# Script de conversao do formato turbomole para xyz
# Autor: Elmar de Oliveira Uhl

sed -n '/$coord/,/$user-defined bonds/ p' coord > temp
sed -n '2,$ p' temp > temp1
tac temp1 | sed -n '2,$ p' | tac > temp

cat temp > temp1

awk '{printf("%2s %20.14f %20.14f %20.14f\n", $4, $1, $2, $3)}' temp1 > temp2
wc -l temp2 > temp4
cut -c -3 temp4 > temp5
echo >> temp5

sed 'y/abcdefghijklmnopqrstuvwxyzàáâãéêíóôõúç/ABCDEFGHIJKLMNOPQRSTUVWXYZÀÁÂÃÉÊÍÓÔÕÚÇ/' temp2 > temp6

cat temp5 temp6

rm -f temp temp1 temp2 temp3 temp4 temp5 temp6

