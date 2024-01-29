#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Obtem geometria otimizada no formato xyz da saida do guassian

file=$1

# Obtem o simbolo dos atomos
sed -n '/ Symbolic Z-matrix:/,/ GradGradGradGradGradGradGradGradGradGradGradGradGradGradGradGradGradGrad/p' $file > temp.1
sed -n '3,$ p' temp.1 > temp.2 
tac temp.2 | sed -n '4,$ p' | tac > temp.3
awk '{printf("%s\n",$1)}' temp.3 > temp.4

# Obtem as coordenadas xyz otimizada
sed -n '/-- Stationary point found./,/Population analysis using the SCF density./p' $file > temp.5
sed -n '/Standard orientation:/,/ Rotational constants (GHZ):/p' temp.5 > temp.6
sed -n '6,$ p' temp.6 > temp.7
tac temp.7 | sed -n '3,$ p' | tac > temp.8
awk '{printf("%s\t%s\t%s\n", $4, $5, $6)}' temp.8 > temp.9

paste temp.4 temp.9 > temp.10

# Formata a saida
awk '{printf("%2s %10.6f %10.6f %10.6f\n",$1,$2,$3,$4)}' temp.10

# Remove os arquivos temporarios
rm -f temp.1 temp.2 temp.3 temp.4 temp.5 temp.6 temp.7 temp.8 temp.9 temp.10


