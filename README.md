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

    echo "A. Region dengan Profit Sedikit:"

    region=$(awk -F '\t'  '{arr[$13]+=$21}
    END {
    for (hasil in arr) {print hasil}
    }' Sample-Superstore.tsv | sort -g | head -1)
    echo "$region"

*  region=$ = Memasukkan hasil Central pada variable region   
* {arr[$13]+=$21} = Menambahkan profit pada setiap region yang sama 
*  for (hasil in arr) = memasukan isi arr ke hasil
* {print hasil} = Mengeprint hasil
* }' Sample-Superstore.tsv = Membaca file .tsv
*  | sort -g| = Mengurutkan terkecil ke terbesar
*  head -1 = Mengambil baris pertama paling atas

>  B. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling
      sedikit berdasarkan hasil poin a
      
      echo " "
      echo "B. 2 Negara dengan Profit Sedikit:"

      state=$(awk -F '\t' -v a=$region '{if($13==a)arr[$11]+=$21}
      END {
      for(hasil in arr) {print arr[hasil]"  "hasil}
      }' Sample-Superstore.tsv | sort -g | head -2)
      echo "$state"
      
*  state=$( = Memasukkan hasil State yang memiliki profit sedikit pada variable state
*  a=$region =Memasukkan isi dari region ke variable a
* '{if($13==a)arr[$11]+=$21} = Jika diketahui region = "Central" Menambahkan profit pada setiap state yang sama  
*  for(hasil in arr) = memasukan isi arr ke hasil
*  {print arr[hasil]"  "hasil} = Mengeprint hasil
*  }' Sample-Superstore.tsv = Membaca file .tsv
*  | sort -g | = Mengurutkan terkecil ke terbesar
*  head -2 = Mengambil 2 baris paling atas


> C. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling
      sedikit berdasarkan 2 negara bagian (state) hasil poin b
      
      echo " "
      echo "C. 10 Produk yang memiliki Profit paling sedikit berdasarkan 2 negara: "

      awk -F '\t' -v a=$region '{if($11 == "Texas" || $11 == "Illinois")arr[$17]+=$21
      }
      END {
      for(hasil in arr) {print arr[hasil]" "hasil}
      }' Sample-Superstore.tsv | sort -g | head -10   
 
*  a=$region =Memasukkan isi dari region ke variable a 
*  if ($11 == "Texas" || $11 == "Illinois") arr[$17]+=$21 = Menambahkan profit pada setiap produk sama yang terdapat pada state       "Texas" dan "Illinois"   
*  for(hasil in arr) = memasukan isi arr ke hasil
* {print arr[hasil]" "hasil} = Mengeprint hasil
*  | sort -g | = Mengurutkan terkecil ke terbesar
*  head -10 = Mengambil sepuluh baris paling atas

2. Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan.

   (A) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. 
   
   (B) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA                                berupa alphabet.
   
   (C) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b.) dan 

   (D) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.
   
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
   
   
   

3. Pada soal ini kita diminta untuk :
   (a) membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" kemudian menyimpan log message wget kedalam sebuah file "wget.log"
   (b) membuat penjadwalan untuk menjalankan script download tersebut, dimana script download tersebut hanya berjalan setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari sabtu. 
   (c) mengecek apakah gambar yang didownload identik atau tidak. Jika identik, sisakan 1 gambar, dan sisanya dipindahkan ke dalam folder ./duplicate dengan format filename "duplicate_nomor", kemudian semua gambar yang tersisa dipindahkan ke dalam folder ./kenangan dengan format filename "kenangan_nomor". Lalu setelah current directory kosong, seluruh log di backup menjadi ekstensi log.bak

 
