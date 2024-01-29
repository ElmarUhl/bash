#! /bin/bash

# Remove do inicio da linha até o 1o ponto

sed 's/\./#/' $1 > temp.1
sed 's/^.*#//' temp.1 > temp.2
sed 's/^ \+//' temp.2 > temp.3

cat temp.3

