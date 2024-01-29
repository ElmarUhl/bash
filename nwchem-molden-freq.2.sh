#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# 21 Maio 2015
# Converte a saida de um calculo de frequencia do nwchem para o formato molden

# GEOMETRIA
sed -n '/Optimization converged/,/Atomic Mass/ p' $1 > otimizado.temp
sed -n '/Geometry/,/Atomic Mass/ p' otimizado.temp > temp.1
sed -n '8,$ p' temp.1 > temp.2
tac temp.2 | sed -n '3,$ p' | tac > temp.3
awk '{printf("%2s\t%6d\t%5d\t%13.9f\t%13.9f\t%13.9f\n",$2,$1,$3,$4,$5,$6)}' temp.3 > temp.4
echo '[Molden Format]'
echo '[GEOMETRIES] XYZ'
natoms=$(cat temp.3 | wc -l)
echo $natoms
echo
awk '{printf("%2s %12.6f %12.6f %12.6f\n", $1, $4, $5, $6)}' temp.4

# FREQUENCIES
echo '[FREQ]'
sed -n '/NORMAL MODE EIGENVECTORS IN CARTESIAN COORDINATES/,/Normal Eigenvalue/ p' $1 > temp.5
sed -n '/ Frequency/ p' temp.5 > temp.6
sed 's/ Frequency//' temp.6 > temp.7
sed ':a;$!N;s/\n//;ta;' temp.7 > temp.8
sed 's/[ ]\+/ /g' temp.8 > temp.9
sed 's/ /\n/g' temp.9 > temp.10
sed -n '2,$ p' temp.10 > temp.11
awk '{printf("%10.4f\n",$1)}' temp.11

# INTENSITIES
echo '[INT]'
sed -n '/Infra Red Intensities/,/ ----------------------------------------------------------------------------/ p' $1 > temp.12
sed 's/Projected Infra Red Intensities/Remover a partir daqui/' temp.12 > temp.13
sed -n '/Infra Red Intensities/,/Remover a partir daqui/ p' temp.13 > temp.14
sed -n '4,$ p' temp.14 > temp.15
tac temp.15 | sed -n '3,$ p' | tac > temp.16
awk '{printf("%10.4f %10.4f\n", $4,0.0)}' temp.16 > temp.17
cat temp.17

# COORDINATES
echo '[FR-COORD]'
awk '{printf("%2s%12.6f%12.5f%12.6f\n",$2,$4*1.889725989,$5*1.889725989,$6*1.889725989)}' temp.3

# NORMAL MODES VECTORS
echo '[FR-NORM-COORD]' 
sed -n '/ Frequency/,/Normal Eigenvalue/ p' temp.5 > temp.18
tac temp.18 | sed -n '6,$ p' | tac > temp.19

#awk '!/Frequency/ {print $0}' temp.19 > temp.20
awk 'NF>0 {print}' temp.19 > temp.20
echo xxx > temp.21
cat temp.20 >> temp.21

tac temp.21 | sed -e '/Frequency/{N;d;}' | tac > temp.22
awk '{printf("%12d %10.5f %10.5f %10.5f %10.5f %10.5f %10.5f\n",$1,$2,$3,$4,$5,$6,$7)}' temp.22 > temp.23

let nmodos=3*natoms

N=1
I=2

grupos=$(echo $nmodos/6 | bc)
resto=$(echo $nmodos%6 | bc)

if [ $resto ]
then
  let grupos=grupos+1
fi

for I in $(seq 1 $grupos)
do
 let inicio=(I-1)*$nmodos
 let fim=I*$nmodos

 awk "(NR > $inicio && NR <= $fim) {print}" temp.23 > temp.24
 awk '{printf("%f\t%f\t%f\t%f\t%f\t%f\n",$2,$3,$4,$5,$6,$7)}' temp.24 > temp.25

 for J in $(seq 1 6)
 do
   awk "{print \$$J}" temp.25 > temp.26

   echo vibration $N
   awk '{if (NR % 3) {printf("%12.6f ",$1)} else {printf("%12.6f\n",$1)}}' temp.26 > temp.27

   cat temp.27

   let N=N+1

   if [ $N -gt $nmodos ]; then
     for i in $(seq 1 27)
     do
      rm temp.$i
     done
     rm otimizado.temp
     exit 0
   fi

 done
done


for i in $(seq 1 27)
do
  rm temp.$i
done

rm otimizado.temp

exit 0
