#! /bin/bash

# Author: Elmar de Oliveira Uhl  16/03/2014
# O arquivo de entrada deve estar da saida xyz do turbomole

workdir=$(pwd)
cp $1 temp

function distance {
   atom1=$1
   atom2=$2

   let "atom1+=2"
   let "atom2+=2"

   sed -n "$atom1 p" temp > temp.1
   sed -n "$atom2 p" temp > temp.2

   read s1 x1 y1 z1 lixo1 lixo2 lixo3 lixo4 < temp.1
   read s2 x2 y2 z2 lixo1 lixo2 lixo3 lixo4 < temp.2

   echo "sqrt(("$x1"-("$x2"))*("$x1"-("$x2"))+("$y1"-("$y2"))*("$y1"-("$y2"))+("$z1"-("$z2"))*("$z1"-("$z2")))" | bc -l > temp.3

   cat temp.3
}

# Atom pairs for distance calculation
# BLA1
R1=$(distance 2 3)
R2=$(distance 2 8)
R3=$(distance 3 6)
# BLA2
R4=$(distance 6 9)
# BLA3
R5=$(distance 10 11)
R6=$(distance 11 14)
R7=$(distance 12 17)
R8=$(distance 16 20)
R9=$(distance 9 10)
R10=$(distance 11 12)
R11=$(distance 16 17)
R12=$(distance 14 15)
R13=$(distance 19 20)

# Calculation of BLAs
echo "========= BLAs distances ========="
# BLA1
echo "Monomero 1"
echo "$R1-($R2+$R3)/2" | bc -l > temp.1
BLA1=$(cat temp.1)
echo "BLA1= $BLA1"
# BLA2
echo "BLA2= $R4"
# BLA3
echo "($R5+$R6+$R7+$R8)/4.0 - ($R9+$R10+$R11+$R12+$R13)/5.0" | bc -l > temp.2
BLA3=$(cat temp.2)
echo "BLA3= $BLA3"

# Atom pairs for distance calculation
# BLA1
R1=$(distance 24 25)
R2=$(distance 23 24)
R3=$(distance 21 25)
# BLA2
R4=$(distance 23 29)
# BLA3
R5=$(distance 30 31)
R6=$(distance 31 34)
R7=$(distance 32 37)
R8=$(distance 36 40)
R9=$(distance 29 30)
R10=$(distance 31 32)
R11=$(distance 36 37)
R12=$(distance 34 35)
R13=$(distance 39 40)
# Calculation of BLAs
echo "Monomero 2"
# BLA1
echo "$R1-($R2+$R3)/2" | bc -l > temp.1
BLA1=$(cat temp.1)
echo "BLA1= $BLA1"
# BLA2
echo "BLA2= $R4"
# BLA3
echo "($R5+$R6+$R7+$R8)/4.0 - ($R9+$R10+$R11+$R12+$R13)/5.0" | bc -l > temp.2
BLA3=$(cat temp.2)
echo "BLA3= $BLA3"

#BLA4
echo "Monomero 1 - 2"
R14=$(distance 19 21)
echo "BLA4= $R14"
echo

rm temp temp.1 temp.2 temp.3

exit 0
