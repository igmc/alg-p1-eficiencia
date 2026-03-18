#!/bin/bash
# script para lanzar gnuplot para graficar los resultados de las mediciones
# autor: Juan Ignacio Molina
# uso: graficar.sh

script_dir=$(dirname $0)
data_dir="$script_dir/../data"
output_dir="$script_dir/../figures"

# asegurar que existe el directorio de salida
mkdir -p $output_dir

# lanzar gnuplot
gnuplot "$script_dir/exponenciales.gp"
gnuplot "$script_dir/cuadraticos.gp"
gnuplot "$script_dir/logaritmicos.gp"
gnuplot "$script_dir/shellsort.gp"
gnuplot "$script_dir/ordenacion.gp"