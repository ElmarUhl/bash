#Autor: Elmar de Oliveira Uhl
# Converte arquivos mp4 para mp3 no diretorio

list=($(ls *.mp4))

for i in ${list[*]}
do
 nome_base=$(basename $i .mp4)
 echo Convertendo $nome_base.mp4...
 avconv -i "$nome_base.mp4" -vn -acodec libmp3lame -ac 2 -ab 160k -ar 48000 "$nome_base.mp3"
 echo arquivo $nome_base.mp4 convertido para $nome_base.mp3
done 
