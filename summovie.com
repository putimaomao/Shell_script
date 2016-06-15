#!/bin/bash

for i in "$@"                                   # when excute the script add the file name
do
summovie << eof
$i                                              # file_name
33                                              # total frames
${i%.mrc}_sum-1-20.mrc                          # output file name
${i%.mrc}_shifts-1-33.txt                       # input shift file
${i%.mrc}_frc.txt                               # output log file
1                                               # first frame to sum
20                                              # last frame to sum
1.25                                            # apix size
YES                                             # apply dosefilter
1.1                                             # e/A/frame
200                                             # voltage
0                                               # pre-exposure 
YES                                             # Restore noise power after filtering (if no, the result is quite low pass filtered)
eof
done                         
