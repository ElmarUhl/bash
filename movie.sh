#! /bin/bash

# Cria um script para ser usado no Atomeye que converte a sequencia de
# arquivos .cfg em .jpg no diretorio Pic

# Uso: movie.sh n1 n2
#               |  +-> indice do final da sequencia de arquivos .cfg
#               +-> indice do inicio da sequencia de arquivos .cfg

seq $1 $2 > temp

awk '{printf"cfg/%05d.cfg Pic/%05d.jpg\n",$1,$1}' temp > temp2

echo "80" > scr_anim
cat temp2 >> scr_anim

rm temp temp2

