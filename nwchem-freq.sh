#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# 21 Maio 2015
# Obtem os valores de frequencias e intensidades do nwchem

# FREQUENCIES
echo '# Frequency cm-1' > frequencies.temp
sed -n '/NORMAL MODE EIGENVECTORS IN CARTESIAN COORDINATES/,/Normal Eigenvalue/ p' $1 > temp.1
sed -n '/ Frequency/ p' temp.1 > temp.2
sed 's/ Frequency//' temp.2 > temp.3
sed ':a;$!N;s/\n//;ta;' temp.3 > temp.4
sed 's/[ ]\+/ /g' temp.4 > temp.5
sed 's/ /\n/g' temp.5 > temp.6
sed -n '2,$ p' temp.6 > temp.7
awk '{printf("%10.4f\n",$1)}' temp.7 >> frequencies.temp

# INTENSITIES
echo ' IR Intensities' > intensities.temp
sed -n '/Infra Red Intensities/,/ ----------------------------------------------------------------------------/ p' $1 > temp.8
sed 's/Projected Infra Red Intensities/Remover a partir daqui/' temp.8 > temp.9
sed -n '/Infra Red Intensities/,/Remover a partir daqui/ p' temp.9 > temp.10
sed -n '4,$ p' temp.10 > temp.11
tac temp.11 | sed -n '3,$ p' | tac > temp.12
awk '{printf("%10.4f\n", $4)}' temp.12 >> intensities.temp

paste frequencies.temp intensities.temp

rm temp.1 temp.2 temp.3  temp.4  temp.5 temp.6 temp.7 temp.8 temp.9 temp.10 temp.11 temp.12 frequencies.temp intensities.temp 

exit 0
