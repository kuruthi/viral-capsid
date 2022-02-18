#!/bin/bash
 ### Just for documentation

##### Takes the txt file with the SRA ids as the argument.
##### A text file only containing the SRA ids can be obtained from the NCBI website


set -e ## Exit if problems arise
set -x

url="https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=" ## assign the consistent part of the NCBI url to a variable

## while do done loop to read from the input file

input_file="$1" ## the argument i.e file name goes here

while read -r line ## read line one to variable line
do wget -v $url$line -O output/$line ## output the html files to dir output with file name as the SRA id
done < $input_file 
#wget -i $1

cd output 

### now we need to extract the json data from the html files
