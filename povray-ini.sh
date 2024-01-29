#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Modifica os arquivos pov.ini gerados no jmol, introduzindo fundo transparente e aumentando a resolução

scale=2

cat $1 > temp

sed -n '/Width/ p' temp > width.temp
cat width.temp | cut -c 7- > temp.1
cat temp.1 > width.temp

sed -n '/Height/ p' temp > height.temp
cat height.temp | cut -c 8- > temp.1
cat temp.1 > height.temp

paste width.temp height.temp > temp.1

read w h < temp.1

new_w=$(echo "$scale*$w" | bc)
new_h=$(echo "$scale*$h" | bc)

sed "s/$w/$new_w/g" temp > temp.1
sed "s/$h/$new_h/g" temp.1 > temp
echo "Output_Alpha=true" >> temp
echo "Quality=9" >> temp

mv temp $1

cat $1

rm height.temp temp.1 width.temp

exit


