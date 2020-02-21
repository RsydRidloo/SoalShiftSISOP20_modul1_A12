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
    awk -F '        '   '{arr[$13]+=$21} 
    END {
        for (hasil in arr) {print hasil}
    }' Sample-Superstore.tsv | sort -g | head -1
    
* {arr[$13]+=$21} = Menambahkan profit pada setiap region yang sama 
*  for (hasil in arr) = kemudian mengecek region yang memiliki profit terkecil dan masuk pada hasil
* {print hasil} = Mengeprint hasil
* }' Sample-Superstore.tsv = Membaca fike .tsv
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
 
*  if ($11 == "Texas" || $11 == "Illinois") arr[$17]+=$21 =
*  for(hasil in arr) {print arr[hasil]" "hasil} =
*  | sort -g | = Mengurutkan terkecil ke terbesar
*  head -10 = Mengambil sepuluh baris paling atas
