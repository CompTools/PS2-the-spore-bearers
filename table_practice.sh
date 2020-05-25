#/bin/bash

#practice with printf

divider===================================
divider=$divider$divider

header="%-6s %10s %10s %10s\n"
format="%-6s %10d %10d %10d\n"

width=39

printf "$header" "GNV to" "Flights" "Delayed" "Weather"

printf "%$width.${width}s\n" "$divider" 

printf "$format" \
ATL 35 23 22 \
CLT 14 6 2 \
MIA 26 11 8

# %d will display integers
# %s will display literal input
# %width determines length of the divider
# you must specify the number of characters for each cell.  That is how you space
