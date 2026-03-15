#!/bin/bash
# script para lanzar la medición de algoritmos exponenciales
# autor: Juan Ignacio Molina
# uso: recoger_exponencial.sh

script_dir=$(dirname $0)
bin_dir="$script_dir/../bin"
fibo="$bin_dir/fibonacci"
hanoi="$bin_dir/hanoi"

# parámetros de medición para fibonacci
inicio_fibonacci=3
fin_fibonacci=35
incremento_fibonacci=1

# parámetros de medición para hanoi
inicio_hanoi=3
fin_hanoi=33
incremento_hanoi=1

programas=(
    fibonacci
    hanoi)

# lanzar la medición

$script_dir/medicion.sh $fibo $inicio_fibonacci $fin_fibonacci $incremento_fibonacci
$script_dir/medicion.sh $hanoi $inicio_hanoi $fin_hanoi $incremento_hanoi