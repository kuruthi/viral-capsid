#!/bin/bash
 ### Just for documentation

##### Takes the txt file with the SRA ids as the argument.
##### A text file only containing the SRA ids can be obtained from the NCBI website


set -e ## Exit if problems arise
set -x

url="https://trace.ncbi.nlm.nih.gov/Traces/sra/?run=" ## assign the consistent part of the NCBI url to a variable

## while do done loop to read from the input file

input_file="$1" ## the argument i.e file name goes here

while read -r line
do wget -v $url$line
done < $input_file 
#wget -i $1
