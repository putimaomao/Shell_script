#!/bin/bash

touch cutoff8                                        # make a new file
for i in *.txt
do
a=$(awk 'NR==6{ print $7 }' $i)                      # output value in line6 (NR==6) and column7 ($7) to the variable a
if (( $(bc <<< "$a <= 8") ))                         # floating points comparison (8 is the cutoff ctf value) 
then
  echo "$i" >> cutoff8                               # should make cutoff8 file first 
fi
done
