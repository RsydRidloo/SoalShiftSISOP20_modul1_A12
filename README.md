# Laporan Penjelasan

1. Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum
untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”.
Namun dia tidak dapat menyelesaikan tugas tersebut. Laporan yang diminta berupa :

   A. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling
      sedikit
   
   B. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling
      sedikit berdasarkan hasil poin a

   C. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling
      sedikit berdasarkan 2 negara bagian (state) hasil poin b

Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan
laporan tersebut.

> A. Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling
sedikit ?

    ```echo "A. Region dengan Profit Sedikit:" 
    awk -F '        '   '{arr[$13]+=$21} 
    END {
        for (hasil in arr) {print hasil}
    }' Sample-Superstore.tsv | sort -g | head -1```
    
* {arr[$13]+=$21} = Menambahkan profit pada setiap region yang sama 
*  for (hasil in arr) = kemudian mengecek region yang memiliki profit terkecil dan masuk pada hasil
* {print hasil} = Mengeprint hasil
* }' Sample-Superstore.tsv = Membaca file .tsv
*  | sort -g| = Mengurutkan terkecil ke terbesar
*  head -1 = Mengambil baris pertama paling atas

>  B. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling
      sedikit berdasarkan hasil poin a
      
    echo "B. 2 Negara dengan Profit Sedikit:"
    awk -F '        '  '$13 ~/Central/ {arr[$11]+=$21}
    END {
    for(hasil in arr) {print arr[hasil]"  "hasil}
    }' Sample-Superstore.tsv | sort -g | head -2
    
*  $13 ~/Central/ = Karena diketahui hasil point a adalah central 
* {arr[$11]+=$21} = Menambahkan profit pada setiap state yang sama  
*  for(hasil in arr) = kemudian mengecek state yang memiliki profit terkecil dan masuk pada hasil
*  {print arr[hasil]"  "hasil} = Mengeprint hasil
*  }' Sample-Superstore.tsv = Membaca file .tsv
*  | sort -g | = Mengurutkan terkecil ke terbesar
*  head -2 = Mengambil 2 baris paling atas

> C. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling
      sedikit berdasarkan 2 negara bagian (state) hasil poin b
      
    echo "C. 10 Produk yang memiliki Profit paling sedikit berdasarkan 2 negara: "
    awk -F '        '  '$13 ~/Central/{
    if ($11 == "Texas" || $11 == "Illinois") arr[$17]+=$21
    }
    END {
    for(hasil in arr) {print arr[hasil]" "hasil}
    }' Sample-Superstore.tsv | sort -g | head -10
 
*  if ($11 == "Texas" || $11 == "Illinois") arr[$17]+=$21 = Menambahkan profit pada setiap produk sama yang terdapat pada state "Texas" dan "Illinois"   
*  for(hasil in arr) 
* {print arr[hasil]" "hasil} = Mengeprint hasil
*  | sort -g | = Mengurutkan terkecil ke terbesar
*  head -10 = Mengambil sepuluh baris paling atas

2. Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan.

   (A) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. 
   
   (B) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA                                berupa alphabet.
   
> (A) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. 
   (B) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA                                berupa alphabet.
   
      #!/bin/bash

      for var in $@;do

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

        fi

        done                      
   
 
