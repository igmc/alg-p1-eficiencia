#!/bin/bash
# script genérico para medir un ejecutable sobre un rango de tamaños de entrada
# autor: Juan Ignacio Molina
# uso: medicion.sh <programa> <inicio> <fin> <incremento>


# exigir al menos el programa y parámetros de medicion
if [ $# -lt 4 ]; then
    echo "Uso: $0 <programa> <inicio> <fin> <incremento>"
    exit 1
fi

script_dir=$(dirname $0)
bin_dir="$script_dir/bin"


ejecutable=$1
inicio=$2
fin=$3
incremento=$4
tam_semilla=42
salida=".$ROOT_DIR/data/$(basename $ejecutable).dat"

echo "Escribiendo en $salida..."

i=$inicio

# asegurar que existe el directorio de salida
mkdir -p $(dirname $salida)

# asegurar que el archivo de salida existe, vaciar y añadir cabecera de columnas
echo "n t_$(basename $ejecutable)" > $salida

while [ $i -le $fin ]; do
    $ejecutable $tam_semilla $i | tee -a $salida
    (( i += incremento ))
done

# fin del script
