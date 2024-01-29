#! /bin/bash

# Calcula o numero o tempo transcorrido a partir de uma data em segundos, minutos, horas, dias, meses e anos

ref_day=$(date +%s -d $1)


now_day=$(date +%s)

seconds=$(echo "$now_day-$ref_day" | bc -l)
minutes=$(echo "$seconds/60" | bc -l)
hour=$(echo "$minutes/60" | bc -l)
day=$(echo "$hour/24" | bc -l)
month=$(echo "$day/30" | bc -l)
year=$(echo "$month/12" | bc -l)

echo "seconds=$seconds"
echo "minutes=$minutes"
echo "hour=$hour"
echo "day=$day"
echo "month=$month"
echo "year=$year"

exit 0
