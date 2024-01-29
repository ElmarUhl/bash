#! /bin/bash

# Programa de scan de endereços TCP/IP
# Autor: Elmar de Oliveira Uhl

init_scan=0 # endereco de inicio
fin_scan=255 # endereco final

for i in $(seq $init_scan $fin_scan)
do
  ping -w 3 192.168.0.$i #limite de tentativas de 3s
done

exit

