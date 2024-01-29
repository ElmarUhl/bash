# Autor: Elmar de Oliveira Uhl
# Converte arquivos mov para avi no diretorio

#! /bin/bash

list=($(ls *.MOV))

for i in ${list[*]}
do
 nome_base=$(basename $i .MOV)
 avconv -i "$nome_base.MOV" "$nome_base.avi"
 #avconv -i video-1.MOV video-1.avi;
done

exit 0

