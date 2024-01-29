#! /bin/bash

# Gera sequencias de numeros aleatorios
# Uso: random.sh n
#                +-> Quantos numeros aleatorio se deseja gerar

for i in $(seq 1 $1)
do
  od -An -N2 /dev/random >> temp
done

awk '{printf" %d",$0}' temp

rm temp

