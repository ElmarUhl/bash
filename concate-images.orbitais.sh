#! /bin/bash

# Autor: Elmar de Oliveira Uhl
# Concatena imagens dos orbitais em uma unica imagem

file1=orbital-283.png
file2=orbital-284.png
file3=orbital-285.png
file4=orbital-286.png

convert $file1 $file2 $file3 $file4 +append temp.1.png

file1=orbital-287.png
file2=orbital-288.png
file3=orbital-289.png
file4=orbital-290.png

convert $file1 $file2 $file3 $file4 +append temp.2.png

file1=orbital-291.png
file2=orbital-292.png
file3=orbital-293.png
file4=orbital-294.png

convert $file1 $file2 $file3 $file4 +append temp.3.png

file1=orbital-295.png
file2=orbital-296.png
file3=orbital-297.png
file4=orbital-298.png

convert $file1 $file2 $file3 $file4 +append temp.4.png

file1=orbital-299.png
file2=orbital-300.png
file3=orbital-301.png
file4=orbital-302.png

convert $file1 $file2 $file3 $file4 +append temp.5.png

file1=orbital-303.png
file2=orbital-304.png
file3=orbital-305.png
file4=orbital-306.png

convert $file1 $file2 $file3 $file4 +append temp.6.png

file1=orbital-307.png
file2=orbital-308.png
file3=orbital-309.png
file4=orbital-310.png

convert $file1 $file2 $file3 $file4 +append temp.7.png

convert temp.1.png temp.2.png temp.3.png temp.4.png temp.5.png temp.6.png temp.7.png -append temp.png

rm temp.1.png temp.2.png temp.3.png temp.4.png temp.5.png temp.6.png temp.7.png

exit
