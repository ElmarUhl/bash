#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Separa o arquivo em menores com tamnho maximo de 3 Gb

file_input=$1

#echo $file_input

split -d -b 3G $file_input $file_input.

#cat $file_input