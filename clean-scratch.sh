# !/bin/sh

#Autor: Elmar de Oliveira Uhl
# Efetua a limpeza do scratch nas maquinas

list=("dalton" "dlt01" "dlt02" "dlt03" "dlt04"  "dlt05" "dlt06" "dlt07" "dlt08"  "dlt09" "dlt10" "dlt11" "dlt12"  "dlt13" "dlt14" "dlt15" "dlt16"  "dlt17")

#echo $list

for i in ${!list[*]}
do
  echo Efetuando login em ${list[i]}
  ssh ${list[i]} "echo Efetuando a limpeza do scratch; rm -rf /scratch/$USER/*; exit"
done


