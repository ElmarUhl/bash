#! /bin/bash

#Autor: Elmar de Oliveira Uhl
# Efetua a temperatura do processadores

list=("dalton" "dlt01" "dlt02" "dlt03" "dlt04"  "dlt05" "dlt06" "dlt07" "dlt08"  "dlt09" "dlt10" "dlt11" "dlt12"  "dlt13" "dlt14" "dlt15" "dlt16"  "dlt17")

for i in ${!list[*]}
do
  echo Efetuando login em ${list[i]}
  ssh ${list[i]} "/usr/bin/sensors; exit"
done

#/usr/bin/sensors
