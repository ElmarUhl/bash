#Autor: Elmar de Oliveira Uhl
# Converte arquivos jpg para pdf no diretorio

#! /bin/bash

list=($(ls *.jpg))

for i in ${list[*]}
do
 nome_base=$(basename $i .jpg)
 convert "$nome_base.jpg" "$nome_base.pdf"
done

exit 0

