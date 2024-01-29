#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Converte a ultima coluna da saida dos gradientes do NWChem em segundos para dias, horas, min e segundos

sed -n '3,$ p' $1 > temp.1 # Remove as 3 primeiras linhas
echo 000000.0 > temp.day
awk '{print $9}' temp.1 >> temp.day # Coluna de tempo
nl=$(wc -l temp.day | awk '{print $1}') # numero de linhas no arquivo
n=$(echo $nl-1 | bc)

for i in $(seq 1 $n)
do
 ii=$(echo $i + 1 | bc)
 awk "NR==$i || NR==$ii" temp.day > temp.2 # imprime linha e linha seguinte
 tac temp.2 | sed 'N;s/\n/-/' > temp.3 # Inverte a sequencia do arquivo de entrada concatena as duas linhas e insere o sinal -
 cat temp.3 | bc > temp.4 # Calcula a diferença
 awk '{printf("%d\n",$1)}' temp.4 > temp.5
 secs=$(cat temp.5)
 printf '%3dd %02dh %02dm %02ds\n' $(($secs/86400)) $(($secs%86400/3600)) $(($secs%3600/60)) $(($secs%60)) >> temp.6
done

echo "days hh  mm  ss" > temp.7
echo ---------------- >> temp.7
cat temp.6 >> temp.7

paste $1 temp.7
rm temp.1 temp.day temp.2 temp.3 temp.4 temp.5 temp.6 temp.7

exit
