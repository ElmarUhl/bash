#! /bin/bash

for i in $(seq $1 $2)
do
  cat merge-$i.jpg.txt.txt >> merge.txt
done

exit 0

