# Autor: Elmar de Oliveira Uhl
# Converte colunas de um arquivo texto em linhas
#! /bin/bash

cat $1 | awk '{print " "$1}' > temp1
sed ':a;$!N;s/\n//;ta;' temp1 > temp2

cat $1 | awk '{print " "$2}' > temp3
sed ':a;$!N;s/\n//;ta;' temp3 > temp4

cat $1 | awk '{print " "$3}' > temp5
sed ':a;$!N;s/\n//;ta;' temp5 > temp6

cat $1 | awk '{print " "$4}' > temp7
sed ':a;$!N;s/\n//;ta;' temp7 > temp8

cat $1 | awk '{print " "$5}' > temp9
sed ':a;$!N;s/\n//;ta;' temp9 > temp10

cat $1 | awk '{print " "$6}' > temp11
sed ':a;$!N;s/\n//;ta;' temp11 > temp12

cat $1 | awk '{print " "$7}' > temp13
sed ':a;$!N;s/\n//;ta;' temp13 > temp14

cat $1 | awk '{print " "$8}' > temp15
sed ':a;$!N;s/\n//;ta;' temp15 > temp16

cat temp2 temp4 temp6 temp8 temp10 temp12 temp14 temp16 > temp17
sed ':a;$!N;s/\n//;ta;' temp17 > temp18

cat temp18

rm temp1 temp2 temp3 temp4 temp5 temp6 temp7 temp8 temp9 temp10 temp11 temp12 temp13 temp14 temp15 temp16 temp17 temp18

