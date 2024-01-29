#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Separa os coeficientes do estados em arquivos para plotagem no R

# Extrai o trecho da saida do nwchem contendo informacoes das excitacoes
sed -n '/Ground state/,/Task/p' $1 > temp.1
sed -n '3,$ p' temp.1 > temp.2
tac temp.2 | sed -n '10,$ p' | tac > temp.3
#exit

# Remove as linhas desnecessarias
sed '/Transition Moments/d' temp.3 > temp.4
sed '/Dipole/d' temp.4 > temp.5
sed '/^$/d' temp.5 > temp.6
sed '/---------/d' temp.6 > temp.7
#exit

# Obtem o numero de estados calculados
sed -n '/Root/ p' temp.7 > temp.8
states=$(wc -l temp.8 | awk '{print $1}')
#exit

# Separa as raizes em arquivos
for i in $(seq 1 $states)
do
  sed -n "/$(echo $i | awk '{printf("Root %3s\n", $1)}') /,/Root/ p" temp.7 > root.$i.temp
done
#exit

# Remove as linhas desnecessarias
for i in $(seq 1 $states)
do
  sed -n "2,$ p" root.$i.temp > root.$i.temp2
  mv root.$i.temp2 root.$i.temp
  tac root.$i.temp | sed -n "2,$ p" | tac > root.$i.temp2
  mv root.$i.temp2 root.$i.coefs
done
#exit

rm temp.* root.*.temp

exit
exit 0

