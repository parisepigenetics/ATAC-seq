#!/bin/bash
while read line
do
    if [[ ${line:0:1} == '>' ]]
    then
        outfile=$1_${line#>}
        echo $line > "$outfile"
    else
        echo $line >> "$outfile"
    fi
done < $1


