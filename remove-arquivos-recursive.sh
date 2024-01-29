#! /bin/bash
# Remove arquivos recursivamente

#find ./ -iname '*.mp4' -exec rm {} \;
find ./ -iname '*.MOV' -exec rm {} \;
#find ./ -iname 'mp4tomp3.sh' -exec rm {} \;
find ./ -iname 'mov2mp4.sh' -exec rm {} \;
find ./ -iname '*~' -exec rm {} \;
