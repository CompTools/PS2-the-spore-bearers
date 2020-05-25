#!/bin/bash

#menu-driven script to answer problem set 2
input="mini.csv"
DELAY=5
clear
while true
do
clear
echo "
    What is your quest?

        1. Count number of delayed flights to/from an airport
        2. Produce table to compare delays from GNV to ATL, CLT, & MIA
        3. See unique airport codes (list)
        4. See airports in Florida in dataset
        5. TSA reminder
        0. Quit

        (answers displayed 5s)
     "
    read -p "  Enter selection [0-5] > " REPLY

    case "$REPLY" in
          1)
               echo "Enter airport of interest => "
               read airport
               awk -F"," -v airport=$airport '{if (($3 ~ airport || $7 ~ airport) && ($13 ~ /1/ || $16 ~/1/)) print $0}' $input > list.csv
               echo "delayed flights to or from $airport: " && wc -l < list.csv
               sleep "$DELAY"
               unlink list.csv
               ;;
          2)
               echo "working on it..."
               sleep "$DELAY"
               ;;
          3)
                list1="$(awk -F"," 'FNR > 1 { gsub(/"/,"", $3); print ($3) }' $input)"
                list2="$(awk -F"," 'FNR > 1 { gsub(/"/,"", $7); print ($7) }' $input)"
                list3=$list1' '$list2
                echo $list3 | tr ' ' '\n' | sort | uniq
               sleep "$DELAY"
               ;;
          4)    
                awk -F, '{if ($5 ~ /FL/ ) { print $4 }}' $input | sort -u > aa.csv && awk -F, '{if ($9 ~ /FL/) {print $8 }}' $input | sort -u > bb.csv

                cat aa.csv bb.csv > cc.csv
                sort -u cc.csv | tr -d "\""
	
               sleep "$DELAY"
                unlink aa.csv
                unlink bb.csv
                unlink cc.csv
               ;;
          5)
               echo "If you see something, say something."
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
     done
