#Autor: Elmar de Oliveira Uhl
# Converte arquivos mov para mp4 no diretorio

#! /bin/bash

list=($(ls *.MOV))

for i in ${list[*]}
do
 nome_base=$(basename $i .MOV)
 avconv -i "$nome_base.MOV" -c:a mp3 -c:v libx264 "$nome_base.mp4"
 #avconv -i video-1.MOV -c:a mp3 -c:v libx264 video-1.mp4;
 # avconv -i video-1.MOV -c:v libx264 -video-1.avi;
done

exit 0

