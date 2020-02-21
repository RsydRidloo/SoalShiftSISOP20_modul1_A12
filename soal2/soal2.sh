#!/bin/bash

flag=1
while [[ $flag == 1 ]]
do
read -p "Masukan hanya alphabet saja:" var
if [[ ! $var =~ ^[[a-zA-Z]]+$ ]]
then
flag=0

randompswrd=$(head /dev/urandom|tr -dc A-Za-z0-9 |head -c 28 )
echo "$randompswrd"  > "$var".txt

else
        echo "Salah"
fi
done
