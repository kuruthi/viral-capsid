#!/bin/bash

##### Takes the txt file with the SRA ids as the argument.
##### A text file only containing the SRA ids can be obtained from the NCBI website

set -e ## Exit if problems arise
#set -x ## For debugging
## Edit this variable if there is a change to the NCBI url structure
url="https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=" ## assign the consistent part of the NCBI url to a variable

## getting the User's choice
read -p 'SRA file(1) or Single SRA id(2) : ' choice

#echo $choice

if [ $choice -eq 1 ] ## == is for strings
then
    read -p 'Enter the SRA file name with path :' file
   #echo $file

    while read -r line ## read line one to variable line
    do echo Running argument $line && wget -q -O - $url$line | grep "\"name\":" > $line.json ## wget  results get grepped with the keyword
    ## -q tag quiet and clean terminal result -O - to send the output to STDOUT
    done < $file
else
    read -p 'Enter the SRA id : ' sra_id
    echo Running argument $sra_id && wget -q -O - $url$sra_id | grep "\"name\":" > $sra_id.json ## adding the file extension gives a better looking result
#wget -i $1
fi

