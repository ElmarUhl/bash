#! /bin/bash

#Autor: Elmar de Oliveira Uhl
# Efetua a leitura de temperatura do processadores

list=("dalton" "dlt01" "dlt02" "dlt03" "dlt04"  "dlt05" "dlt06" "dlt07" "dlt08"  "dlt09" "dlt10" "dlt11" "dlt12"  "dlt13" "dlt14" "dlt15" "dlt16"  "dlt17")

rm disk-free.log info.log meminfo.log

for i in ${!list[*]}
do
  echo Efetuando login em ${list[i]}

  echo ${list[i]} >> info.log
  ssh ${list[i]} "uptime; exit" >> info.log
  echo >> info.log

  echo ${list[i]} >> disk-free.log
  ssh ${list[i]} "df -h; exit" >> disk-free.log
  echo >> disk-free.log

  echo ${list[i]} >> meminfo.log
  ssh ${list[i]} "cat /proc/meminfo; exit" >> meminfo.log
  echo >> meminfo.log

done

#/usr/bin/sensors
