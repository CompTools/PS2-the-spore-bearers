#!/bin/bash

#shell script to parse csv file

input="mini.csv"

echo "Enter airport of interest => "
read airport
	
awk -F"," -v airport=$airport '{
     if (($3 ~ airport || $7 ~ airport) && ($13 ~ /1/ || $16 ~/1/)) print $0
     }' $input > new.csv
     
echo "delayed flights to or from $airport => " && wc -l < new.csv

#head -n 1 prints the first line of the original csv and adds to new csv
# -F option indicates delimiter to awk (here, a comma)
# $3 specifies third column, ~ tells awk to look for /regex/
# for successful matches, print $0 = print entire line of match
# specify the file to do the awk command AFTER the if expression (here, $input)
# >> append to new csv
