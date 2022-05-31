#!/bin/bash

#Author: P. Venkateshwar,
#Date: 31-05-2022,
#Modified: 31-05-2022,

#Description 
#This file holds the functions used in the scrape script file
## Edit this variable if there is a change to the NCBI url structure
url="https://trace.ncbi.nlm.nih.gov/Traces/sra/?run="

function from_file {
        dos2unix "$input_file"
        while read -r line
        do ## read line one to variable line
        #loading $line
        wget -q -O - "$url$line" | grep "\"name\":" | sed 's_var\ oTaxAnalysisData\ =\ _\ _' | sed '$ s_}},\ _}]_' | sed 's_\"d\":{__' | sed 's_}},_},_' > "$line.json" ## wget  results get grepped with the keyword name inside quotes which is present in all lines of the data
        ## -q tag quiet and clean terminal result -O - to send the output to STDOUT
        ## sed to clean the data grepped
        done < "$input_file"
echo "DONE"
}

function id_search { 
        wget -q -O - "$url$id" | grep "\"name\":" | sed 's_var\ oTaxAnalysisData\ =_\ _' | sed '$ s_}},\ _}]_' | sed 's_\"d\":{__' | sed 's_}},_},_'  > "$id.json" ## adding the file extension gives a better looking result
    echo "DONE"
}

function helpsra {
echo
echo "[USAGE] scrape -f [FILENAME] or scrape -i [SRA id]"
echo "scrape -h to print this help"
echo
echo "The script takes two types of arguments, A file containing the SRA ids for batch processing or a single SRA id"
echo "The file should contain only one SRA id per line."
echo "Such a file can be obtained from the NCBI website through Download > File > Accession number"
}
