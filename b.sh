#!/bin/bash

#shell script to parse csv file

input="mini.csv"

head -n 1 $input > new.csv && awk -F"," '{
         if (($3 ~ /GNV/ ||$7 ~ /GNV/) && ($13 ~ /1/ || $16 ~/1/))
            print $0
     }' $input >> new.csv && echo 'check new.csv'
     
#head -n 1 prints the first line of the original csv and adds to new csv
# -F option indicates delimiter to awk (here, a comma)
# $3 specifies third column, ~ tells awk to look for /regex/
# for successful matches, print $0 = print entire line of match
# specify the file to do the awk command AFTER the if expression (here, $input)
# >> append to new csv
