#!/bin/bash

for i in `cat ctfabove8A`
do grep $i Refine3D/*data.star > Refine3D/*data_ctfabove8A.star
done
