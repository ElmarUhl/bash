#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Obtem os ips

netstat -na > temp.1
grep tcp temp.1 > temp.2



cat temp.2

rm temp.1 temp.2
