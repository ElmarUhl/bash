#! /bin/bash

# remove o tempo inicial
#avconv -i input_file -ss 00:00:28 -sameq -acodec copy -vcodec copy output_file

# remove o tempo final
avconv -i video-1.MOV -t 00:05:05 -acodec copy -vcodec copy video-1.2.MOV

exit 0

