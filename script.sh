#!/bin/bash

##### Takes the txt file with the SRA ids as the argument.
##### A text file only containing the SRA ids can be obtained from the NCBI website

set -e ## Exit if problems arise
set -x ## Comment out in the final version
## Edit this variable if there is a change to the NCBI url structure
url="https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=" ## assign the consistent part of the NCBI url to a variable

## getting the User's choice
read -p 'SRA file(1) or Single SRA id(2) : ' choice

#echo $choice

if [ $choice==1 ]
then
    read -p 'Enter the SRA file name with path :' file
   #echo $file

    while read -r line ## read line one to variable line
    do wget -nv $url$line -O $line.html ## output the html files with sra id as file name
    ## remove -nv tag to get verbose result
    done < $file
else
    read -p 'Enter the SRA id : ' sra_id
    wget -nv $url$sra_id -O $sra_id.html ## adding the file extension gives a better looking result
#wget -i $1
fi

### now we need to extract the json data from the html files
#grep '\"name\"' output/
