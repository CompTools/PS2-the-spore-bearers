#!/bin/bash

#shell script to parse csv file

input="mini.csv"

echo "Enter airport of interest => "
read airport
	
awk -F"," -v airport=$airport '{
     if (($3 ~ airport || $7 ~ airport) && ($13 ~ /1/ || $16 ~/1/)) print $0
     }' $input > new.csv
     
echo "delayed flights to or from $airport => " && wc -l < new.csv

# read airport names the variable airport
# but then you have to specify it again for awk with airport=$airport 
# -v option specifies that there's a variable in the awk expression
# -F option indicates which delimiter awk looks for (here, a comma)
# $3 specifies third column, ~ tells awk to look for variable or /regex/
# for successful matches, print $0 = print entire line of match
# specify the file to do the awk command AFTER the if expression (here, $input)
# > exports to new.csv
# wc -l counts the lines (=number of flights) in new.csv
