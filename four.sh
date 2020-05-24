#!/bin/bash

#This is the Spore Bearers' script for Problem Set 2
#elena's branch


#Question 4 
#Use awk to search if FL appears in column $5 if so then print the city name from column $4
#use awk to search if FL appears in column $9 if so then print to city name from column $8
#sort unique each step into a new csv file
#merge the two csv files aa.csv and bb.csv
#sort unique into cc.csv


input=flights.May2017-Apr2018.csv
awk -F, '{if ($5 ~ /FL/) {print $4 }}' $input | sort -u > aa.csv && awk -F, '{if ($9 ~ /FL/) {print $8 }}' $input | sort -u > bb$

cat aa.csv bb.csv > cc.csv
sort -u cc.csv


