#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Remove os espacos em branco de nomes de arquivos

for f in *.jpg
do
 mv "$f" "${f// /}"
done


