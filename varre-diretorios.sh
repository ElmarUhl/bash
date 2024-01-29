# Autor: Elmar de Oliveira Uhl
# Varre subdiretorios e executa comandos

#! /bin/bash

ls -al | grep '^d' > temp.1
sed -n '3,$ p' temp.1 > temp.2
cat temp.2 | cut -c 45- > temp.3

wc -l temp.3 > temp.4
read lines files < temp.4

for i in $(seq 1 $lines)
do
   directory=$(sed -n "$i p" temp.3)
   cd "$directory"
# Insira aqui os comandos a serem executados
   ./mp4tomp3.sh
# -------------------------------------------
   cd ..
done

rm temp.1 temp.2 temp.3 temp.4

exit

#list=(H2O Nitroethylene PCBM Pentacene PPV PPV-GW PTB1-Elmar-Charge-Analysis PTB1_production SCRIPTS  Stilbene TCNE_complex trash)

#for i in ${list[*]}
#do
# echo Arquivando $i...
# echo 'tar -cf' $i.tar $i/
#done
