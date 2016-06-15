#!/bin/bash

for i in *.txt
do
a=$(awk 'NR==6{ print $7 }' $i)                      # output value in line6 (NR==6) and column7 ($7) to a variable a
if (( $(bc <<< "$a <= 8") ))                         # floating points comparison (8 is the cutoff ctf value) 
then
  mv $i selebetterctf8                                  # should make selebetterctf8 directory first 
fi
done
