#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Obtem a geometria otimizada no formato xyz do NWCHEM


#sed '/ Optimization converged/,$!d' $1 > temp.1

#sed -n '/Geometry "geometry" -> "geometry"/,/Atomic Mass/ p' $1

sed -n '/Geometry "geometry" -> "geometry"/{h;${x;p;};d;};H;${x;p;}' $1 > temp.1
sed -n '8,/Atomic Mass/ p' temp.1 > temp.2
tac temp.2 | sed -n '3,$ p' | tac > temp.3
awk '{printf("%s\t%s\t%s\t%s\n",$2,$4,$5,$6)}' temp.3 > temp.4
wc temp.4 | awk '{print $1}' > temp.5
echo >> temp.5
cat temp.4 >> temp.5
cat temp.5

rm temp.1 temp.2 temp.3 temp.4 temp.5
