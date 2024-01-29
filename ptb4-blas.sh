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

#echo
#echo "========= Printing input ========="
#cat temp
#echo

# Atom pairs for distance calculation
# BLA1
R1=$(distance 76 77)
R2=$(distance 73 77)
R3=$(distance 75 76)
# BLA2
R4=$(distance 73 72)
# BLA3
R5=$(distance 70 62)
R6=$(distance 62 66)
R7=$(distance 61 63)
R8=$(distance 64 69)
R9=$(distance 72 70)
R10=$(distance 62 61)
R11=$(distance 66 65)
R12=$(distance 63 64)
R13=$(distance 69 68)

# Print distances calculated
#echo "========= Distances to BLAs ========="
#echo "BLA1 - " $R1 $R2 $R3
#echo "BLA2 - " $R4
#echo "BLA3 - " $R5 $R6 $R7 $R8 $R9 $R10 $R11 $R12 $R13
#echo "BLA4 - " $R14
#echo

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
R1=$(distance 56 57)
R2=$(distance 55 56)
R3=$(distance 57 53)
# BLA2
R4=$(distance 53 52)
# BLA3
R5=$(distance 50 42)
R6=$(distance 42 46)
R7=$(distance 41 43)
R8=$(distance 44 49)
R9=$(distance 52 50)
R10=$(distance 42 41)
R11=$(distance 46 45)
R12=$(distance 43 44)
R13=$(distance 49 48)
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

# Atom pairs for distance calculation
# BLA1
R1=$(distance 36 37)
R2=$(distance 33 37)
R3=$(distance 36 35)
# BLA2
R4=$(distance 33 32)
# BLA3
R5=$(distance 30 22)
R6=$(distance 22 26)
R7=$(distance 21 23)
R8=$(distance 24 29)
R9=$(distance 32 30)
R10=$(distance 22 21)
R11=$(distance 26 25)
R12=$(distance 23 24)
R13=$(distance 29 28)
# Calculation of BLAs
echo "Monomero 3"
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
# Atom pairs for distance calculation
# BLA1
R1=$(distance 16 17)
R2=$(distance 17 13)
R3=$(distance 16 15)
# BLA2
R4=$(distance 13 12)
# BLA3
R5=$(distance 10 2)
R6=$(distance 2 6)
R7=$(distance 1 3)
R8=$(distance 4 9)
R9=$(distance 12 10)
R10=$(distance 2 1)
R11=$(distance 6 5)
R12=$(distance 3 4)
R13=$(distance 9 8)
# Calculation of BLAs
echo "Monomero 4"
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
echo

#BLA4
echo "Monomero 1 - 2"
R14=$(distance 68 55)
echo "BLA4= $R14"
# BLA4
echo "Monomero 2 - 3"
R14=$(distance 48 35)
echo "BLA4= $R14"
# BLA4
echo "Monomero 3 - 4"
R14=$(distance 28 15)
echo "BLA4= $R14"
echo

rm temp temp.1 temp.2 temp.3

exit 0
