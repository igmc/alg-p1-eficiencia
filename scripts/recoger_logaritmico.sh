#!/bin/bash
# script para lanzar la medición de algoritmos O(n log n)
# autor: Juan Ignacio Molina
# uso: recoger_logaritmico.sh

script_dir=$(dirname $0)
bin_dir="$script_dir/../bin"

# parámetros de medición
inicio=500000
fin=5000000
incremento=100000

programas=(
    mergesort
    mergesort_peor
    heapsort
    quicksort)

# lanzar la medición
for programa in ${programas[@]}; do
    ejecutable="$bin_dir/$programa"
    $script_dir/medicion.sh $ejecutable $inicio $fin $incremento
done