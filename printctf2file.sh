#!/bin/bash

touch ctfprint                                        # create a new file 
for i in "$@"
do
a=$(awk 'NR==6{ print $7 }' $i)
echo "$i $a" >> ctfprint                              # add output to the end of ctfprint
done
