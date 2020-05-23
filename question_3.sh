#!/bin/bash

#shell script to solve question 3

input="extramini.csv"

awk -F"," 'FNR > 1 { print ($3) }' $input | sort -u > a.csv && awk -F"," ' FNR > 1 { print ($7) }' $input | sort -u > b.csv 

cat a.csv b.csv > c.csv
sort -u c.csv



# FNR > 1 tells awk to ignore the first line of text
# $3 specifies third column, $7 specifies seventh column, 
# > exports to a new file
# cat merges the two new files into a third file
# sort -u removes duplicates from printed list of codes, in this case it is used 3 times for the first list, second list, and combined list
