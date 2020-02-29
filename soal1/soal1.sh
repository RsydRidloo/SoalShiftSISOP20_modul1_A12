#!/bin/bash

echo "A. Region dengan Profit Sedikit:"

region=$(awk -F '\t'  '{arr[$13]+=$21}
END {
        for (hasil in arr) {print hasil}
}' Sample-Superstore.tsv | sort -g | head -1)
echo "$region"


echo " "
echo "B. 2 Negara dengan Profit Sedikit:"

state=$(awk -F '\t' -v a=$region '{if($13==a)arr[$11]+=$21}
END {
        for(hasil in arr) {print arr[hasil]"  "hasil}
}' Sample-Superstore.tsv | sort -g | head -2)
echo "$state"

echo " "
echo "C. 10 Produk yang memiliki Profit paling sedikit berdasarkan 2 negara: "

awk -F '\t' -v a=$region '{if($11 == "Texas" || $11 == "Illinois")arr[$17]+=$21
}
END {
        for(hasil in arr) {print arr[hasil]" "hasil}
}' Sample-Superstore.tsv | sort -g | head -10
