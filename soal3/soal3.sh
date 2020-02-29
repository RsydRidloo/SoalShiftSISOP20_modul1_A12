#!/bin/bash

count=1

while read p; do
for ((i=1; i<=28; i=i+1))
do

        wget -O "pdkt_kusuma_${count}.jpg" $p -a wget.log
                count=$((count+1))

       done
done <list.txt

