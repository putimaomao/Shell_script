#!/bin/bash

for i in "$@"                            # when execute command, add file name
do 
unblur << eof
$i                                       # input file name
33                                       # total frames
${i%.mrc}_sum-1-33.mrc                   # output file name
${i%.mrc}_shifts-1-33.txt                # output shift name
1.25                                     # apix
YES                                      # apply dosefilter
1.1                                      # e/A/frame
200                                      # voltage
0                                        # pre-exposure
NO                                       # save aligned frames
NO                                       # set expert options 
eof
done
