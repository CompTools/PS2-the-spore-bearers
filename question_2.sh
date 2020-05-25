#!\bin\bash

#question2.sh
#me working on 2nd question

input="medium.csv"

echo "Enter arrival airport => "
read arrival

awk -F"," -v arrival=$arrival '{
if (($3 ~ /GNV/) && ($7 ~ arrival)) print $0
}' $input > arr.csv

echo "flights arriving at $arrival from Gainesville => " && wc -l < arr.csv

echo "Enter arrival airport again=> "
read arrival

awk -F"," -v arrival=$arrival '{
if (($3 ~ /GNV/) && ($7 ~ arrival) && ($13 ~ /1/ || $16 ~ /1/)) print $0
}' $input > arr.csv

echo "delayed flights arriving at $arrival from Gainesville => " && wc -l < arr.csv

echo "Enter arrival airport one more time=> "
read arrival

awk -F"," -v arrival=$arrival '{
if (($3 ~ /GNV/) && ($7 ~ arrival) && ($13 ~ /1/ || $16 ~ /1/) && ($24 ~ /[0-9]+/) ) print $0
}' $input > arr.csv

echo "weather-delayed flights arriving at $arrival from Gainesville => " && wc -l < arr.csv

