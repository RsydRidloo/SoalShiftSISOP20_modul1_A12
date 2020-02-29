#!/bin/bash


nama=$(echo $1 | awk 'BEGIN{FS="."}{printf("%s",$1)}')

#Mengambil waktu (jam) dari file waktu.txt
tgl=$(date -r waktu.txt +"%H")

#dekripsi
diff=$(($tgl*(-1)+26))


#decrypt given filename caesar cipher method
kecil=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
besar=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
nama_baru=$(echo "$nama" | tr "${kecil:0:26}" "${kecil:${diff}:26}" | tr "${besar:0:26}" "${besar:${diff}:26}")

#rename file
mv "$1" "$nama_baru.txt"
