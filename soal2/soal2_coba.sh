#!/bin/bash

#Mengambil nama input z
nama=$(echo $1 | awk 'BEGIN{FS="."}{printf("%s",$1)}')

#Mengambil waktu pada file waktu.txt
tgl=$(date -r waktu.txt +"%H")

#konversi huruf
kecil=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
besar=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
nama_baru=$(echo "$nama" | tr "${kecil:0:26}" "${kecil:${tgl}:26}" | tr "${besar:0:26}" "${besar:${tgl}:26}")

#memberi nama setelah di enkrip
mv "$1" "$nama_baru.txt"

echo "Nama baru adalah $nama_baru.txt"
