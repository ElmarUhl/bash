#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Executa comandos nos arquivos listados

#files=("Card 01.jpg" "Card 06.jpg" "Instr 03.jpg" "Card 01_overleaf.jpg" "Cover_back.jpg" "Instr 04.jpg" "Card 02.jpg"  "Cover_back_overleaf.jpg" "Card 02_overleaf.jpg" "Cover_front.jpg" "Card 03.jpg" "Cover_front_overleaf.jpg" "Paper 01.jpg" "Card 04.jpg" "Instr 01.jpg" "Paper 02.jpg" "Card 05.jpg" "Instr 02.jpg")

#files=$(ls *.jpg)
files=$(ls *.ini)

for i in $files
do
  povray $i
#  ./povray-ini.sh $i
#  convert $i $i.pdf

done
