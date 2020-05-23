#!/bin/bash

#shell script to solve question 3

input="mini.csv"

awk -F"," 'FNR > 1 { print ($3) }' $input | sort -u && awk -F"," ' FNR > 1 { print ($7) }' $input | sort -u | > try.csv  | sort -u



# read airport names the variable airport
# but then you have to specify it again for awk with airport=$airport 
# -v option specifies that there's a variable in the awk expression
# -F option indicates which delimiter awk looks for (here, a comma)
# $3 specifies third column, ~ tells awk to look for variable or /regex/
# for successful matches, print $0 = print entire line of match
# specify the file to do the awk command AFTER the if expression (here, $input)
# > exports to new.csv
# wc -l counts the lines (=number of flights) in new.csv
#sort -u will be needed somewhere

