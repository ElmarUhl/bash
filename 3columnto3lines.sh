#! /bin/bash

# Transformar 3 colunas em 3 linhas
# Autor: Elmar de Oliveira Uhl

awk '{print $1}' teste.txt > simmetry.temp
awk '{print $2}' teste.txt > energia.temp
awk '{print $3}' teste.txt > foo.temp

sed ':a;$!N;s/\n/ /;ta;' simmetry.temp > simmetry.temp2
sed ':a;$!N;s/\n/ /;ta;' energia.temp > energia.temp2
sed ':a;$!N;s/\n/ /;ta;' foo.temp > foo.temp2

cat simmetry.temp2 energia.temp2 foo.temp2 > excitacoes.out

rm simmetry.temp energia.temp foo.temp simmetry.temp2 energia.temp2 foo.temp2
