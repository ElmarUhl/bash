#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Converte a saida do nwchem e o arquivo de coeficiente dos orbitais em ascii do nwchem para o formato molden
# Uso do script:
#
#      nwchem2molden.sh file.nwo file.mov2asc
#
#

# Define o formato molden
echo [Molden Format]
#exit


# obtem o titulo do arquivo de saida
echo [Title]
sed -n '1,/Scaling/ {/NWChem Input Module/,/Scaling/ p}' $1 > title.temp # primeiro trecho
sed -n '5 p' title.temp > temp
sed 's/[ ]\+/ /g' temp > title.temp
cat title.temp
rm temp title.temp
#exit


# coordenadas da molecula
echo [Atoms] Angs
sed -n '/Optimization converged/,$ p' $1 > temp.1
size=$(ls -l temp.1 | awk '{printf("%s\n",$5)}') # Verifica se o arquivo não contem dados
if [ $size -eq "0" ]; then
  cp $1 temp.1
fi
sed -n '/Geometry/,/Atomic Mass/ p' temp.1 > temp.2
sed -n '8,$ p' temp.2 > temp.3
tac temp.3 | sed -n '3,$ p' | tac > temp.4
awk '{printf("%2s %5d %4d %15.6E %15.6e %15.6e\n",$2,$1,$3,$4,$5,$6)}' temp.4 > geometry.temp
cat geometry.temp
rm temp.1 temp.2 temp.3 temp.4
#exit


# bases atomicas
echo [GTO]
sed -n '/Basis/,/Summary/ p' $1 > temp.1
sed -n '3,$ p' temp.1 > temp.2
tac temp.2 | sed -n '4,$ p' | tac > temp.3
#exit

# Separa a bases por atomo !!! Inclua novos atomos aqui
mkdir basis.temp
awk '{
  if ($1 == "H")
    arquivo="./basis.temp/H.basis.temp"  
  else if ($1 == "C")
    arquivo="./basis.temp/C.basis.temp"
  else if ($1 == "N")
    arquivo="./basis.temp/N.basis.temp"
  else if ($1 == "O")
    arquivo="./basis.temp/O.basis.temp"
  else if ($1 == "P")
    arquivo="./basis.temp/P.basis.temp"
  else if ($1 == "Cu")
    arquivo="./basis.temp/Cu.basis.temp"
  else
  {
    echo Atom not found - error
  }
 
  print $0 > arquivo

 }' temp.3

rm -f temp.1 temp.2 temp.3


# remove as linhas desnecessarias do inicio e fim dos arquivos de bases
# inverte o arquivo para contagem
files=$(ls basis.temp)
cd basis.temp
for i in $files
do
  sed -n '5,$ p' $i > temp
  tac temp | sed -n '2,$ p' > temp.1
  echo >> temp.1
  mv temp.1 $i
  rm -f temp temp.1
done
#exit

# efetua a contagem das bases pelas linhas em branco
for i in $files
do
  awk '{
   count=0
   if (length($0) > 0)
   {
     n += 1
     printf(" %16.14E %16.14E\n",$3,$4)
     type = $2
   }
   else
   {
     printf(" %1s %4d 1.00\n",type,n)
     n = 0
   }

  }' $i > temp
  mv temp $i
done
#exit

# inverte o arquivo
for i in $files
do
  tac $i > temp
  mv temp $i
done
#exit

for i in $files
do
  sed 's/S/s/g' $i > temp
  sed 's/P/p/g' temp > temp.1
  sed 's/D/d/g' temp.1 > temp.2
  echo >> temp.2
  mv temp.2 $i
done
rm temp temp.1
cd ..
#exit

# base para cada atomo
awk '{
 printf(" %4d 0\n",$2)
 file="./basis.temp/"$1".basis.temp"
 system("cat " file)
}' geometry.temp
#exit


# coeficientes dos orbitais
echo [MO]

nbf=$(sed -n '14 p' $2) # obtem do arquivo o numero de orbitais
nlines=$(echo "$nbf/3" | bc) # numero de linhas em cada conjunto de dados

resto=$(echo "$nbf%3" | bc) # verifica se há a necessidade de uma linha adicional
if [ $resto -ne "0" ]
then
  nlines=$(echo $nlines+1 | bc)
fi

sed -n '15,$ p' $2 > temp # elimina linhas de topo desnecessarias

# obtem os valores de ocupacao
begin=1
end=$(echo $begin+$nlines-1 | bc)
sed -n "1,$nlines p" temp > temp.1      # conjunto de dados das ocupacoes
sed ':a;$!N;s/\n//;ta;' temp.1 > temp.2 # coloca tudo em uma linha
sed 's/[ ]\+/ /g' temp.2 > temp.1       # remove os espacos duplicados
sed 's/ /\n/g' temp.1 > temp.2          # substitui os espacos por novas linhas
sed -n '2,$ p' temp.2 > temp.1          # remove a primeira linha com espaco
mv temp.1 ocupacao.temp
rm temp.2
#exit

# obtem os autovalores
begin=$(echo $end+1 | bc) 
end=$(echo $begin+$nlines-1 | bc)
sed -n "$begin,$end p" temp > temp.1    # conjunto de dados dos autovalores
sed ':a;$!N;s/\n//;ta;' temp.1 > temp.2 # coloca tudo em uma linha
sed 's/[ ]\+/ /g' temp.2 > temp.1       # remove os espacos duplicados
sed 's/ /\n/g' temp.1 > temp.2          # substitui os espacos por novas linhas
sed -n '2,$ p' temp.2 > temp.1          # remove a primeira linha com espaco
mv temp.1 autovalores.temp
rm temp.2
#exit

# Efetua a montagem da secao dos coeficientes dos orbitais
for i in $(seq 1 $nbf)
do
   echo $i | awk '{printf(" Sym= %4da\n",$1)}' # contagem dos orbitais e simetria

   Ene=$(sed -n "$i p" autovalores.temp) # Imprime o autovalor correspondente
   echo $Ene | awk '{printf(" Ene= %E\n",$1)}'

   echo " Spin= Alpha" # Imprime o spin do orbital

   Ocupp=$(sed -n "$i p" ocupacao.temp) # Imprime a ocupacao
   echo $Ocupp | awk '{printf(" Occup= %f\n",$1)}'

   #Obtem os coeficientes dos orbitais (autovetores)
   begin=$(echo $end+1 | bc)
   end=$(echo $begin+$nlines-1 | bc)
   sed -n "$begin,$end p" temp > temp.1
   sed ':a;$!N;s/\n//;ta;' temp.1 > temp.2 # coloca tudo em uma linha
   sed 's/[ ]\+/ /g' temp.2 > temp.1       # remove os espacos duplicados
   sed 's/ /\n/g' temp.1 > temp.2          # substitui os espacos por novas linhas
   sed -n '2,$ p' temp.2 > temp.1          # remove a primeira linha com espaco
   awk '{printf("%4d %21.14E\n",NR,$1)}' temp.1 > autovetores.temp
   cat autovetores.temp
#   exit
done
rm temp.1 temp.2

rm -rf basis.temp

rm temp geometry.temp ocupacao.temp autovalores.temp autovetores.temp

exit 0

