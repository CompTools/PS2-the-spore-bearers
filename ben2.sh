#!\bin\bash

#question2.sh
#me working on 2nd question

read -e -p "Hi! Please specify input file (.csv):  " file
awk -F"," '{if (($3 ~ /GNV/) print $0 }' $file > temp2.csv
input="temp2.csv"

GNV2ATLf="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /ATL/)) count++ }END{ print count }' $input)"
GNV2ATLd="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /ATL/) && ($13 ~ /1/ || $16 ~ /1/)) count++ }END{print count }' $input)"
GNV2ATLw="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /ATL/) && ($13 ~ /1/ || $16 ~ /1/) && ($24 ~ /[1-9]+/)) count++}END{ print count }' $input)"

GNV2CLTf="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /CLT/)) count++ }END{ print count }' $input)"
GNV2CLTd="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /CLT/) && ($13 ~ /1/ || $16 ~ /1/)) count++ }END{print count }' $input)"
GNV2CLTw="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /CLT/) && ($13 ~ /1/ || $16 ~ /1/) && ($24 ~ /[1-9]+/)) count++}END{ print count }' $input)"

GNV2MIAf="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /MIA/)) count++ }END{ print count }' $input)"
GNV2MIAd="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /MIA/) && ($13 ~ /1/ || $16 ~ /1/)) count++ }END{print count }' $input)"
GNV2MIAw="$(awk -F"," '{if (($3 ~ /GNV/) && ($7 ~ /MIA/) && ($13 ~ /1/ || $16 ~ /1/) && ($24 ~ /[1-9]+/)) count++}END{ print count }' $input)"

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



#echo "GNV 2 ATL flights=" && echo $GNV2ATLf
#echo "GNV 2 ATL delays=" && echo $GNV2ATLd
#echo "GNV 2 ATL weather delays=" && echo $GNV2ATLw

#echo "GNV 2 CLT flights=" && echo $GNV2CLTf
#echo "GNV 2 CLT delays=" && echo $GNV2CLTd
#echo "GNV 2 CLT weather delays=" && echo $GNV2CLTw

#echo "GNV 2 MIA flights=" && echo $GNV2MIAf
#echo "GNV 2 MIA delays=" && echo $GNV2MIAd
#echo "GNV 2 MIA weather delays=" && echo $GNV2MIAw)
