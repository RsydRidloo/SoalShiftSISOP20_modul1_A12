#!/bin/bash


for var in $@;do

touch waktu.txt
if [[ $var =~ ^[a-zA-Z]+$ ]];
then

flag=1
while [ $flag -eq 1 ]
do
randompswrd=$(cat /dev/urandom|tr -dc A-Za-z0-9 | head -c 28)
if [[ "$randompswrd" =~ [A-Z] ]] && [[ "$randompswrd" =~ [a-z] ]] && [[ "$randompswrd" =~ [0-9] ]]
then
flag=0
fi
done

echo "$randompswrd"  > "$var".txt


else
        echo "Salah"
        
