#!/bin/bash
# script para medir algoritmos O(n log n) en rango pequeño
# autor: Juan Ignacio Molina

script_dir=$(dirname $0)
bin_dir="$script_dir/../bin"

inicio=8000
fin=200000
incremento=8000

programas=(
    mergesort
    heapsort
    quicksort)

for programa in ${programas[@]}; do
    ejecutable="$bin_dir/$programa"
    salida="$script_dir/../data/${programa}_pequeno.dat"
    
    echo "n t_${programa}_pequeno" > $salida
    
    i=$inicio
    while [ $i -le $fin ]; do
        $ejecutable 42 $i | tee -a $salida
        (( i += incremento ))
    done
done