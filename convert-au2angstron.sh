#! /bin/bash

# Converte os valores de coordenadas de bohr para angstrom
# Autor: Elmar de Oliveira Uhl

sed -n '3,$ p' $1 > temp.1
awk '{printf("%2s %20.15f %20.15f %20.15f\n", $1, $2*0.529177249, $3*0.529177249, $4*0.529177249)}' temp.1 > temp.2
sed -n '1,2 p' $1 > temp.3
cat temp.3 temp.2

rm -rf temp.1 temp.2 temp.3
