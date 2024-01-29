#Autor: Elmar de Oliveira Uhl
# Converte arquivos mp4 para mp3 no diretorioY

ls *.mp4 > temp.1

wc -l temp.1 > temp.2
read lines files < temp.2

sed "s/.mp4//" temp.1 > temp.3

for i in $(seq 1 $lines)
do
   file=$(sed -n "$i p" temp.3)

   echo Convertendo $file.mp4...
   avconv -i "$file.mp4" -vn -acodec libmp3lame -ac 2 -ab 160k -ar 48000 "$file.mp3"
# echo arquivo $nome_base.mp4 convertido para $nome_base.mp3
done 
