#!/bin/bash

for i in *.txt
do
a=$(awk 'NR==6{ print $7 }' $i)
echo "$i" "$a"
done
