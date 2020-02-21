#!/bin/bash

echo "A. Region dengan Profit Sedikit:"
awk -F '        '  '{arr[$13]+=$21}
END {
        for (hasil in arr) {print hasil}
}' Sample-Superstore.tsv | sort -g | head -1

echo " "
echo "B. 2 Negara dengan Profit Sedikit:"
awk -F '        '  '$13 ~/Central/ {arr[$11]+=$21}
END {
        for(hasil in arr) {print arr[hasil]"  "hasil}
}' Sample-Superstore.tsv | sort -g | head -2

echo " "
echo "C. 10 Produk yang memiliki Profit paling sedikit berdasarkan 2 negara: "
awk -F '        '  '$13 ~/Central/{
        if ($11 == "Texas" || $11 == "Illinois") arr[$17]+=$21
}
END {
        for(hasil in arr) {print arr[hasil]" "hasil}
}' Sample-Superstore.tsv | sort -g | head -10
