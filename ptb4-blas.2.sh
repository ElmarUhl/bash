#! /bin/bash

# Author: Elmar de Oliveira Uhl  16/03/2014
# O arquivo de entrada deve estar da saida xyz do turbomole

workdir=$(pwd)
cp $1 temp.xyz

function distance {
   atom1=$1
   atom2=$2

   let "atom1+=2"
   let "atom2+=2"

   sed -n "$atom1 p" temp.xyz > temp.atom1
   sed -n "$atom2 p" temp.xyz > temp.atom2

   read s1 x1 y1 z1 lixo1 lixo2 lixo3 lixo4 < temp.atom1
   read s2 x2 y2 z2 lixo1 lixo2 lixo3 lixo4 < temp.atom2

   echo "sqrt(("$x1"-("$x2"))*("$x1"-("$x2"))+("$y1"-("$y2"))*("$y1"-("$y2"))+("$z1"-("$z2"))*("$z1"-("$z2")))" | bc -l > distance.temp

   cat distance.temp
}

# Atom pairs for distance calculation
# BLA1
R1=$(distance 76 77)
R2=$(distance 76 80)
R3=$(distance 73 77)
R4=$(distance 75 76)
R5=$(distance 80 79)
# BLA2
R6=$(distance 73 72)
# BLA3
R7=$(distance 70 62)
R8=$(distance 62 66)
R9=$(distance 61 63)
R10=$(distance 64 65)
R11=$(distance 64 69)
R12=$(distance 72 70)
R13=$(distance 62 61)
R14=$(distance 63 64)
R15=$(distance 66 65)
R16=$(distance 69 68)
# Calculation of BLAs
# BLA1
echo "# arquivo: $1" > blas.dat
echo "# BLA1	BLA2	BLA3" >> blas.dat
echo "Monomero1" > temp.1
echo "($R1+$R2)/2.0 - ($R3+$R4+$R5)/3.0" | bc -l > temp
BLA1=$(cat temp)
echo $BLA1 > temp.2
# BLA2
echo "$R6" > temp.3
# BLA3
echo "($R7+$R8+$R9+$R10+$R11)/5.0 - ($R12+$R13+$R14+$R15+$R16)/5.0" | bc -l > temp
BLA3=$(cat temp)
echo "$BLA3" > temp.4
paste temp.1 temp.2 temp.3 temp.4 >> blas.dat

# Atom pairs for distance calculation
# BLA1
R1=$(distance 56 57)
R2=$(distance 60 56)
R3=$(distance 57 53)
R4=$(distance 55 56)
R5=$(distance 60 59)
# BLA2
R6=$(distance 53 52)
# BLA3
R7=$(distance 50 42)
R8=$(distance 42 46)
R9=$(distance 41 43)
R10=$(distance 44 45)
R11=$(distance 44 49)
R12=$(distance 52 50)
R13=$(distance 42 41)
R14=$(distance 43 44)
R15=$(distance 46 45)
R16=$(distance 49 48)

# Calculation of BLAs
echo "Monomero2" > temp.1
# BLA1
echo "($R1+$R2)/2.0 - ($R3+$R4+$R5)/3.0" | bc -l > temp
BLA1=$(cat temp)
echo "$BLA1" > temp.2
# BLA2
echo "$R6" > temp.3
# BLA3
echo "($R7+$R8+$R9+$R10+$R11)/5.0 - ($R12+$R13+$R14+$R15+$R16)/5.0" | bc -l > temp
BLA3=$(cat temp)
echo "$BLA3" > temp.4
paste temp.1 temp.2 temp.3 temp.4 >> blas.dat

# Atom pairs for distance calculation
# BLA1
R1=$(distance 36 37)
R2=$(distance 40 36)
R3=$(distance 33 37)
R4=$(distance 36 35)
R5=$(distance 40 39)
# BLA2
R6=$(distance 33 32)
# BLA3
R7=$(distance 30 22)
R8=$(distance 22 26)
R9=$(distance 21 23)
R10=$(distance 24 25)
R11=$(distance 24 29)
R12=$(distance 32 30)
R13=$(distance 22 21)
R14=$(distance 23 24)
R15=$(distance 26 25)
R16=$(distance 29 28)
# Calculation of BLAs
echo "Monomero3" > temp.1
# BLA1
echo "($R1+$R2)/2.0 - ($R3+$R4+$R5)/3.0" | bc -l > temp
BLA1=$(cat temp)
echo "$BLA1" > temp.2
# BLA2
echo "$R6" > temp.3
# BLA3
echo "($R7+$R8+$R9+$R10+$R11)/5.0 - ($R12+$R13+$R14+$R15+$R16)/5.0" | bc -l > temp
BLA3=$(cat temp)
echo "$BLA3" > temp.4
paste temp.1 temp.2 temp.3 temp.4 >> blas.dat

# Atom pairs for distance calculation
# BLA1
R1=$(distance 16 17)
R2=$(distance 20 16)
R3=$(distance 17 13)
R4=$(distance 16 15)
R5=$(distance 20 19)
# BLA2
R6=$(distance 13 12)
# BLA3
R7=$(distance 10 2)
R8=$(distance 2 6)
R9=$(distance 1 3)
R10=$(distance 4 5)
R11=$(distance 4 9)
R12=$(distance 12 10)
R13=$(distance 2 1)
R14=$(distance 3 4)
R15=$(distance 6 5)
R16=$(distance 9 8)

# Calculation of BLAs
echo "Monomero4" > temp.1
# BLA1
echo "($R1+$R2)/2.0 - ($R3+$R4+$R5)/3.0" | bc -l > temp
BLA1=$(cat temp)
echo "$BLA1" > temp.2
# BLA2
echo "$R6" > temp.3
# BLA3
echo "($R7+$R8+$R9+$R10+$R11)/5.0 - ($R12+$R13+$R14+$R15+$R16)/5.0" | bc -l > temp
BLA3=$(cat temp)
echo "$BLA3" > temp.4
paste temp.1 temp.2 temp.3 temp.4 >> blas.dat

#BLA4
echo "# arquivo: $1" > bla4.dat
echo "# BLA4" >> bla4.dat
echo "Monomero1-2" > temp.1
R14=$(distance 68 55)
echo "$R14" > temp.2
# BLA4
echo "Monomero2-3" >> temp.1
R14=$(distance 48 35)
echo "$R14" >> temp.2
# BLA4
echo "Monomero3-4" >> temp.1
R14=$(distance 28 15)
echo "$R14" >> temp.2
paste temp.1 temp.2 >> bla4.dat

rm temp temp.1 temp.2 temp.3 temp.4 temp.atom1 temp.atom2 distance.temp temp.xyz

exit 0
