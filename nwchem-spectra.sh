#! /bin/bash

sed -n '/Root/ p' $1 > temp.1
sed -n '/Dipole Oscillator Strength/ p' $1 > temp.2

paste temp.1 temp.2 > temp.3

sed 's/Root//' temp.3 > temp.4
sed 's/a.u.//' temp.4 > temp.5
sed 's/eV//' temp.5 > temp.6
sed 's/Dipole Oscillator Strength//' temp.6 > temp.7

sed 's/[ ]\+/\t/g' temp.7 > temp.8

echo "#	Root	Degen	Symm	energy a.u.	energy eV		OOS"
cat temp.8

rm temp.1 temp.2 temp.3 temp.4 temp.5 temp.6 temp.7 temp.8

exit 0

