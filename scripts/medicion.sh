#!/bin/zsh
# script genérico para medir un ejecutable sobre un rango de tamaños de entrada
# autor: Juan Ignacio Molina
# uso: medicion.sh <programa> <inicio> <fin> <incremento> [archivo-salida]


# exigir al menos el programa y parámetros de medicion
if [ $# -lt 4 ]; then
    echo "Uso: $0 <programa> <inicio> <fin> <incremento> [archivo-salida]"
    exit 1
fi

script_dir=$(dirname $0)
bin_dir="$script_dir/bin"


# parámetros por defecto para el bucle
inicio=100
fin=20000
incremento=200


ejecutable=$1
inicio=$2
fin=$3
incremento=$4
tam_semilla=42

# archivo de salida ejecutable.dat o el indicado
if [ $# -ge 5 ]; then
    salida=$5
else
    salida=".$ROOT_DIR/data/$(basename $ejecutable).dat"
fi

echo "Escribiendo en $salida..."

i=$inicio
# asegurar que el archivo de salida existe para que el append funcione
echo "" > $salida
while [ $i -lt $fin ]; do
    $ejecutable $tam_semilla $i >> $salida
    (( i += incremento ))
done

# fin del script