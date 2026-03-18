#!/bin/bash
# script para lanzar las mediciones de todos los programas
# autor: Juan Ignacio Molina
# uso: lanzar_mediciones.sh

script_dir=$(dirname $0)

$script_dir/recoger_cuadratico.sh
$script_dir/recoger_logaritmico.sh
$script_dir/recoger_exponencial.sh
$script_dir/medicion_nlog_pequena.sh
