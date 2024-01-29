#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Le a saida do gaussian e converte para xyz

sed -n '/Stationary point found/,$ p' $1 > temp.1
sed -n '/Standard orientation/,/Rotational constants/ p' temp.1 > temp.2
sed -n '6,$ p' temp.2 > temp.3
tac temp.3 | sed -n '3,$ p' | tac > temp.4

awk '{
 if ($2 == 1) {
   element = "H"
 }
 else if ($2 == 6) {
   element = "C"
 }
 else if ($2 == 16) {
   element = "S"
 }
 else {
   print "erro"
   exit
 }

 printf("%2s %10.6f %10.6f %10.6f\n",element,$4,$5,$6)

}' temp.4 > temp.5

wc -l temp.5 | awk '{print $1}'
echo
cat temp.5

rm -f temp.1 temp.2 temp.3 temp.4 temp.5


