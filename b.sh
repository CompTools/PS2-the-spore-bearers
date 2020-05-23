#!/bin/bash

#shell script to parse csv file

input="mini.csv"

head -n 1 $input > new.csv && awk -F"," '{
         if (($3 ~ /GNV/ ||$7 ~ /GNV/) && ($13 ~ /1/ || $16 ~/1/))
            print $0
     }' $input >> new.csv && echo 'check new.csv'

