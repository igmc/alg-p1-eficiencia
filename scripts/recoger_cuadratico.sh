#!/bin/bash
# script para lanzar la medición de algoritmos cuadráticos
# autor: Juan Ignacio Molina
# uso: recoger_cuadratico.sh

script_dir=$(dirname $0)
bin_dir="$script_dir/../bin"

# parámetros de medición
inicio=8000
fin=200000
incremento=8000

programas=(
    burbuja
    insercion
    seleccion
    shellshort
    shellshort_peor
    quicksort_peor)

# lanzar la medición
for programa in ${programas[@]}; do
    ejecutable="$bin_dir/$programa"
    $script_dir/medicion.sh $ejecutable $inicio $fin $incremento
done