#!/bin/sh
NUMLINES=0

#Loop through every line 
while read LINE
do
    #To skip the header
    if [ "$NUMLINES" -gt 0 ]; then
	#Read type 1
	TYPE=$(echo $LINE | cut -d',' -f 3)
	
	#Check if there is a directory named after type 1
	if [ ! -d $TYPE ]; then
	    #If not, make directory then create a csv file in it named after the type
	    mkdir $TYPE
	    echo $HEADER >> "$TYPE/$TYPE.csv"
	fi
        
	#In the csv file of the matching type, write the line in like pokemon.csv
	echo $LINE >> "$TYPE/$TYPE.csv"
    else
	#Copy the header to put in every file
	HEADER=$LINE
    fi
    NUMLINES=`expr $NUMLINES + 1`
done < pokemon.csv



