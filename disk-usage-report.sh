#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# 30 Outubro 2014

# Script para gerar relatorios de uso de espaco em disco pelos
# usuarios

users=$(ls /home)

for i in  $users
do
  du -h /home/$i > $i.1.temp
  tail $i.1.temp > $i.2.temp
  tac $i.2.temp > $i.3.temp
  sed -n '1p' $i.3.temp > $i.4.temp
done

clear

data=$(date)

echo "Relatorio gerado em $data"
echo 

echo "Dados gerais de espaco do disco"
echo "-------------------------------------------------------------------------------"
df -h

echo
echo "Espaco ocupado pelos usuarios"
echo "-------------------------------------------------------------------------------"

for i in $users
do
  cat $i.4.temp
done

rm *.1.temp *.2.temp *.3.temp *.4.temp

echo
