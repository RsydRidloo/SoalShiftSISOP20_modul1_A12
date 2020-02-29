## Angelita Titiandes Br. Silalahi ( 05111840000088 )
## Rasyid Ridlo W ( 05111840000135 )


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

    echo "A. Region dengan Profit Sedikit:" region=$(awk -F '\t'  '{arr[$13]+=$21} END { for (hasil in arr) {print hasil} }' Sample-Superstore.tsv | sort -g | head -1) echo "$region"
    
* {arr[$13]+=$21} = Menambahkan profit pada setiap region yang sama 
*  for (hasil in arr) = Memasukkan arr kedalam hasil
* {print hasil} = Mengeprint hasil
* }' Sample-Superstore.tsv = Membaca file .tsv
*  | sort -g| = Mengurutkan terkecil ke terbesar
*  head -1 = Mengambil baris pertama paling atas

>  B. Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling
      sedikit berdasarkan hasil poin a
      
      echo " " echo "B. 2 Negara dengan Profit Sedikit:" state=$(awk -F '\t' -v a=$region '{if($13==a)arr[$11]+=$21} END { for(hasil in arr) {print arr[hasil]"  "hasil} }' Sample-Superstore.tsv | sort -g | head -2) echo "$state"
     
* -v a=$region '{if($13==a){arr[$11]+=$21} = Jika yang diketahui Central, maka menambahkan profit pada setiap state yang sama  
*  for(hasil in arr) = Memasukkan arr kedalam hasil
*  {print arr[hasil]"  "hasil} = Mengeprint hasil
*  }' Sample-Superstore.tsv = Membaca file .tsv
*  | sort -g | = Mengurutkan terkecil ke terbesar
*  head -2 = Mengambil 2 baris paling atas

> C. Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling
      sedikit berdasarkan 2 negara bagian (state) hasil poin b
      
    echo " " echo "C. 10 Produk yang memiliki Profit paling sedikit berdasarkan 2 negara: " awk -F '\t' -v a=$region '{if($11 == "Texas" || $11 == "Illinois")arr[$17]+=$21 } END { for(hasil in arr) {print arr[hasil]" "hasil} }' Sample-Superstore.tsv | sort -g | head -10
 
*  if ($11 == "Texas" || $11 == "Illinois") arr[$17]+=$21 = Menambahkan profit pada setiap produk sama yang terdapat pada state "Texas" dan "Illinois"   
*  for(hasil in arr) = Memasukkan arr kedalam hasil
* {print arr[hasil]" "hasil} = Mengeprint hasil
*  | sort -g | = Mengurutkan terkecil ke terbesar
*  head -10 = Mengambil sepuluh baris paling atas

2. Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan.

   (A) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. 
   
   (B) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA                                berupa alphabet.
   
   (C) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b.

   (D) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.
   
> (A) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. 
   (B) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA                                berupa alphabet.
   
      #!/bin/bash
      
      touch waktu.txt
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
        
*  if [[ $var =~ ^[a-zA-Z]+$ ]]; = Cek var harus alphabet
*  randompswrd=$(cat /dev/urandom|tr -dc A-Za-z0-9 | head -c 28) = generate random pasword
*   if [[ "$randompswrd" =~ [A-Z] ]] && [[ "$randompswrd" =~ [a-z] ]] && [[ "$randompswrd" =~ [0-9] ]] = Ngecek apakah ada huruf besar , kecil, dan angka
*    echo "$randompswrd"  > "$var".txt = memasukkan random password pada file txt

>  (C) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b.

      nama=$(echo $1 | awk 'BEGIN{FS="."}{printf("%s",$1)}')
      tgl=$(date -r waktu.txt +"%H")
      
      
      kecil=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
      besar=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
      nama_baru=$(echo "$nama" | tr "${kecil:0:26}" "${kecil:${tgl}:26}" | tr "${besar:0:26}" "${besar:${tgl}:26}")

      mv "$1" "$nama_baru.txt"

      echo "Nama baru adalah $nama_baru.txt"
      
*  nama=$(echo $1 | awk 'BEGIN{FS="."}{printf("%s",$1)}') = Mengambil nama input
*  tgl=$(date -r waktu.txt +"%H") = Mengambil waktu pada file waktu.txt
*  mv "$1" "$nama_baru.txt" = Memberi nama setelah di enkrip

>   (D) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.

      nama=$(echo $1 | awk 'BEGIN{FS="."}{printf("%s",$1)}')

      tgl=$(date -r waktu.txt +"%H")

      diff=$(($tgl*(-1)+26))

      kecil=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
      besar=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
      nama_baru=$(echo "$nama" | tr "${kecil:0:26}" "${kecil:${diff}:26}" | tr "${besar:0:26}" "${besar:${diff}:26}")

      mv "$1" "$nama_baru.txt"
      
*  nama=$(echo $1 | awk 'BEGIN{FS="."}{printf("%s",$1)}') = Mengambil nama input
*  tgl=$(date -r waktu.txt +"%H") =Mengambil waktu pada file waktu.txt
*  diff=$(($tgl*(-1)+26)) = dekripsi
*  mv "$1" "$nama_baru.txt" = rename file
   
   

3. Pada soal ini kita diminta untuk :

   (A) membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" kemudian menyimpan log message wget kedalam sebuah file "wget.log"
   
   (B) membuat penjadwalan untuk menjalankan script download tersebut, dimana script download tersebut hanya berjalan setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari sabtu. 
   
   (C) mengecek apakah gambar yang didownload identik atau tidak. Jika identik, sisakan 1 gambar, dan sisanya dipindahkan ke dalam folder ./duplicate dengan format filename "duplicate_nomor", kemudian semua gambar yang tersisa dipindahkan ke dalam folder ./kenangan dengan format filename "kenangan_nomor". Lalu setelah current directory kosong, seluruh log di backup menjadi ekstensi log.bak
   
> (A) membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" kemudian menyimpan log message wget kedalam sebuah file "wget.log"

      #!/bin/bash

      count=1

      while read p; do
      for ((i=1; i<=28; i=i+1))
      do

        wget -O "pdkt_kusuma_${count}.jpg" $p -a wget.log
                count=$((count+1))

      done
      done <list.txt
      
dengan isi list.txt :

       wget https://loremflickr.com/320/240/cat

* count=1 merupakan inisialisasi variabel count yang nantinya akan digunakan sebagai penomoran pada nama file yang di download(sebenarnya bisa menggunakan variabel i)
* while read p digunakan untuk membaca file p yang dimasukkan di akhir yakni list.txt
* -O "pdkt_kusuma_${count}.jpg" merupakan perintah yang digunakan untuk menamai file yang di download
* $p digunakan untuk mengakses file list.txt yang berisi link download dan perintah wget untuk mendownload file
* -a wget.log digunakan untuk menyimpan log messages wget ke dalam sebuah file yang bernama wget.log

> (B) membuat penjadwalan untuk menjalankan script download tersebut, dimana script download tersebut hanya berjalan setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari sabtu. 

      5 6-23/8 * * 0-5 /home/Downloads/SoalShiftSISOP20_modul1_A12-master/soal3/soal3.sh

* 5 menunjukkan bahwa file akan dieksekusi setiap menit ke 5
* 6-23/8 menunjukkan bahwa file akan dieksekusi mulai jam 6 setiap hari setiap 8 jam sekali
* ** menunjukkan bahwa file akan dieksekusi tanpa ada syarat tanggal apa dan bulan apa, jadi dijalankan mengikuti perintah yang lain
* 0-5 menunjukkan bahwa file akan dieksekusi mulai hari minggu-jumat
* /home/Downloads/SoalShiftSISOP20_modul1_A12-master/soal3/soal3.sh menunjukkan directory file

 
