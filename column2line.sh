#! /bin/bash

sed ':a;$!N;s/\n//;ta;' $1 > temp.1
sed 's/^ \+//' temp.1

exit 0

