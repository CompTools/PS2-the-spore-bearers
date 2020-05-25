#!/bin/bash

#menu-driven script to answer problem set 2
DELAY=5
clear
echo "Please specify input file (csv):  "
read -e file
while true
do
clear
printf ">>  input file: " && printf $file
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
               read airport1
               awk -F "," -v airport1=$airport1  '{if (($3 ~ airport1) || ($7 ~ airport1)) print $0}' $file > temp1.csv
               input1="temp1.csv"
               count1="$(awk -F"," -v airport1=$airport1 '{if (($3 ~ airport1 || $7 ~ airport1) && ($13 ~ /1/ || $16 ~/1/)) count++ }END{ print count }' $input1)"
               echo "delayed flights to or from $airport1: " && echo $count1
               sleep "$DELAY"
               unlink temp1.csv
               ;;
          2)
               awk -F "," '{if ($3 ~ /GNV/) print $0 }' $file > temp2.csv
               input2="temp2.csv"

               GNV2ATLf="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /ATL/)) count++ }END{ print count }' $input2)"
               GNV2ATLd="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /ATL/) && ($13 ~ /1/ || $16 ~ /1/)) count++ }END{print count }' $input2)"
               GNV2ATLw="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /ATL/) && ($13 ~ /1/ || $16 ~ /1/) && ($24 ~ /[1-9]+/)) count++}END{ print count }' $input2)"

               GNV2CLTf="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /CLT/)) count++ }END{ print count }' $input2)"
               GNV2CLTd="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /CLT/) && ($13 ~ /1/ || $16 ~ /1/)) count++ }END{print count }' $input2)"
               GNV2CLTw="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /CLT/) && ($13 ~ /1/ || $16 ~ /1/) && ($24 ~ /[1-9]+/)) count++}END{ print count }' $input2)"

               GNV2MIAf="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /MIA/)) count++ }END{ print count }' $input2)"
               GNV2MIAd="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /MIA/) && ($13 ~ /1/ || $16 ~ /1/)) count++ }END{print count }' $input2)"
               GNV2MIAw="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /MIA/) && ($13 ~ /1/ || $16 ~ /1/) && ($24 ~ /[1-9]+/)) count++}END{ print count }' $input2)"

               divider===================================
               divider=$divider$divider

               header="%-6s %10s %10s %10s\n"
               format="%-6s %10d %10d %10d\n"

               width=39

               printf "$header" "GNV to" "Flights" "Delayed" "Weather"

               printf "%$width.${width}s\n" "$divider" 

               printf "$format" \
               ATL $GNV2ATLf $GNV2ATLd $GNV2ATLw \
               CLT $GNV2CLTf $GNV2CLTd $GNV2CLTw \
               MIA $GNV2MIAf $GNV2MIAd $GNV2MIAw \
               
               sleep "$DELAY"
               unlink temp2.csv
               ;;
          3)
                list1="$(awk -F"," 'FNR > 1 { gsub(/"/,"", $3); print ($3) }' $file)"
                list2="$(awk -F"," 'FNR > 1 { gsub(/"/,"", $7); print ($7) }' $file)"
                list3=$list1' '$list2
                echo $list3 | tr ' ' '\n' | sort | uniq
               sleep "$DELAY"
               ;;
          4)    
                awk -F, '{if ($5 ~ /FL/ ) { print $4 }}' $file | sort -u > aa.csv && awk -F, '{if ($9 ~ /FL/) {print $8 }}' $file | sort -u > bb.csv

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