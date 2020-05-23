#!/bin/bash

#This is the Spore Bearers' script for Problem Set 2
#elena's branch
#part 2
#testing


#input="flights.May2017-Apr2018.csv"

#echo "Enter airport of interest => "
#read airport
	
#awk -F"," -v airport=$airport '{
  #   if (($3 ~ airport || $7 ~ airport) && ($13 ~ /1/ || $16 ~/1/)) print $0
 #    }' $input > new.csv
     
#echo "delayed flights to or from $airport => " && wc -l < new.csv

# read airport names the variable airport
# but then you have to specify it again for awk with airport=$airport 
# -v option specifies that there's a variable in the awk expression
# -F option indicates which delimiter awk looks for (here, a comma)
# $3 specifies third column, ~ tells awk to look for variable or /regex/
# for successful matches, print $0 = print entire line of match
# specify the file to do the awk command AFTER the if expression (here, $input)
# > exports to new.csv
# wc -l counts the lines (=number of flights) in new.csv


#input file
#find both columns that contain FL in column  $5 and $9
#then look in column $4 and $7
#sort unique set 

#input=short.csv
#awk -F"," 'FNR > 1 { print ($5) }' $input | sort -u && awk -F"," ' FNR > 1 { print ($9) }' $input | sort -u | > try.csv  | sort -u

input=short.csv
#awk -F"," '{
#if (($5 || $9

echo "City of interest => "
               read city
               awk -F"," -v city=$city '{
               if (($5 ~ city || $9 ~ city) && ($4 || $8 )) print $0
               }' $input > new.csv 
               echo "cities => " && sort -u < new.csv


#'FNR > 1 { print ($5) }' $input | sort -u && awk -F"," ' FNR > 1 { print ($9) }' $input | sort -u | > try.csv  | sort -u
