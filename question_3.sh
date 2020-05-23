#!/bin/bash

#shell script to solve question 3

input="mini.csv"

awk -F"," 'FNR > 1 { print ($3) }' $input | sort -u && awk -F"," ' FNR > 1 { print ($7) }' $input | sort -u | > try.csv  | sort -u



# FNR > 1 tells awk to ignore the first line of text
# $3 specifies third column, $7 specifies seventh column, 
# > exports to a new file
