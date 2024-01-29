#! /bin/bash

for i in $(seq 1 100)
do
   fileIn="orbital-"$i".png"
   fileOut="orbital-"$i".2.png"
   echo $fileIn $fileOut

   convert $fileIn -crop 230x85+0+0 temp.png
   convert $fileIn -crop 1040x800+110+80 $fileOut

   composite temp.png $fileOut temp.2.png
   mv temp.2.png $fileOut

   mv $fileOut new/
 
done


