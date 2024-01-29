#! /bin/bash

grep cycle gradient > temp
awk '{print $3 " " $7 " " $10}' temp
rm temp
