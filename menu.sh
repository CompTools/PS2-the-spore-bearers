#!/bin/bash

#menu-driven script to answer problem set 2
input="mini.csv"
DELAY=3
clear
echo "
        What can we do for you?

        1. Count number of delayed flights to/from an airport
        2. Produce table to compare delays from GNV to ATL, CLT, & MIA
        3. See unique airport codes (list)
        4. See airports in Florida in dataset
        5. TSA reminder
        0. Quit
     "
    read -p "  Enter selection [0-5] > " REPLY

    case "$REPLY" in
          1)
               echo "Enter airport of interest => "
               read airport
               awk -F"," -v airport=$airport '{
               if (($3 ~ airport || $7 ~ airport) && ($13 ~ /1/ || $16 ~/1/)) print $0
               }' $input > new.csv
               echo "delayed flights to or from $airport => " && wc -l < new.csv
               ;;
          2)
               echo "working on it..."
               sleep "$DELAY"
               ;;
          3)
               echo "working on it..."
               sleep "$DELAY"
               ;;
          4)    
               echo "working on it..."
               sleep "$DELAY"
               ;;
          5)
               echo "if you see something, say something."
               sleep "$DELAY"
               ;;
        
          0) 
               echo "Adios"
               exit
               ;;
          *)
          echo "go fish"
          exit 1
          ;; 
     esac