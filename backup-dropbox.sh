#! /bin/bash

cd $HOME
mkdir backup
cd backup

source=$HOME/Documents/Writer
cp -r $source .

destiny=$HOME/Dropbox/backup

duplicity . file://$destiny

#rm -rf backup
exit







