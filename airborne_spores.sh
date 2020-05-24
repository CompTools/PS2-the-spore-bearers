#!/bin/bash

#This is the Spore Bearers' script for Problem Set 2
#elena's branch


#Question 4 
#Use awk to search if FL appears in column $5 if so then print the city name from column $4


input=flights.May2017-Apr2018.csv
awk -F, '{if ($5 ~ /FL/) {print $4 }}' $input | sort -u > aa.csv && awk -F, '{if ($9 ~ /FL/) {print $8 }}' $input | sort -u > bb.csv

cat aa.csv bb.csv > cc.csv
sort -u cc.csv

