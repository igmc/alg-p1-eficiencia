# script para graficar la eficiencia de algoritmos cuadráticos
# autor: Juan Ignacio Molina


# configurar formato de exportado y tamaño
set terminal pdfcairo size 5, 7 enhanced font "Latin Modern Roman,12" \
    background "#ffffff"

set output "figures/cuadraticos.pdf"

# titulos
set title  "Algoritmos Cuadráticos" font "Latin Modern Roman Bold,17" \
    offset 0,0.8
set xlabel "n"          font "Latin Modern Roman,13" offset 0,-0.5
set ylabel "Tiempo (s)" font "Latin Modern Roman,13" offset -1,0

# ejes y escala
set logscale xy
set format y "10^{%L}"
set format x "10^{%L}"
set xtics font "Latin Modern Roman,11"
set ytics font "Latin Modern Roman,11"
set xrange [6000:250000]

# margenes
set lmargin 10
set rmargin  6
set tmargin  4
set bmargin  11

# bordes
set border 3 lw 1.2 lc rgb "#555555"
set tics nomirror

# cuadricula
set grid xtics ytics lt 0 lc rgb "#CCCCBB" lw 0.8   # subtle dotted

# clave
set key below spacing 1.3 font "Latin Modern Roman,11" \
    box lc rgb "#AAAAAA" lw 0.8 samplen 3.5

# estilos de puntos y lineas
# insercion
set style line 1 lc rgb "#C0392B" pt 6  ps 0.7 lw 1.5   # círculo hueco
set style line 2 lc rgb "#E05C4B" lw 2.2 dt (10,4)

# seleccion
set style line 3 lc rgb "#2471A3" pt 4  ps 0.7 lw 1.5   # cuadrado hueco
set style line 4 lc rgb "#5499C7" lw 2.2 dt (10,4)

# burbuja
set style line 5 lc rgb "#1A7A6E" pt 8  ps 0.7 lw 1.5   # triángulo arriba hueco
set style line 6 lc rgb "#45A899" lw 2.2 dt (10,4)

# shellsort
set style line 7 lc rgb "#7D3C98" pt 10 ps 0.7 lw 1.5   # triángulo abajo hueco
set style line 8 lc rgb "#A569BD" lw 2.2 dt (10,4)

# quicksort (peor caso)
set style line 9  lc rgb "#CA6F1E" pt 12 ps 0.7 lw 1.5  # rombo hueco
set style line 10 lc rgb "#E59866" lw 2.2 dt (10,4)

# ajuste
set fit logfile '/dev/null' quiet

f_insercion(x) =         a * x*x
f_seleccion(x) =         b * x*x
f_burbuja(x) =           c * x*x
f_shellsort(x) =         d * x*x
f_quicksort_peor(x) =    e * x*x

fit f_insercion(x)      'data/insercion.dat'      every ::1 via a
fit f_seleccion(x)      'data/seleccion.dat'      every ::1 via b
fit f_burbuja(x)        'data/burbuja.dat'        every ::1 via c
fit f_shellsort(x)      'data/shellsort.dat'      every ::1 via d
fit f_quicksort_peor(x) 'data/quicksort_peor.dat' every ::1 via e

# graficar

plot 'data/insercion.dat'     every ::1 u 1:2 with points ls 1 title 'Inserción', \
     f_insercion(x)           with lines ls 2 title 'Ajuste Inserción', \
     'data/seleccion.dat'     every ::1 u 1:2 with points ls 3 title 'Selección', \
     f_seleccion(x)           with lines  ls 4 title 'Ajuste Selección', \
     'data/burbuja.dat'       every ::1 u 1:2 with points ls 5 title 'Burbuja', \
     f_burbuja(x)             with lines  ls 6 title 'Ajuste Burbuja', \
     'data/shellsort.dat'     every ::1 u 1:2 with points ls 7 title 'Shellsort', \
     f_shellsort(x)           with lines  ls 8 title 'Ajuste Shellsort', \
     'data/quicksort_peor.dat' every ::1 u 1:2 with points ls 9 title 'Quicksort (peor caso)', \
     f_quicksort_peor(x)      with lines ls 10 title 'Ajuste Quicksort (peor caso)'

# guardar ajuste
set print "./memoria/params_cuadraticos.tex"
print sprintf("\\newcommand{\\paramInsercion}{\\num{%g}}", a)
print sprintf("\\newcommand{\\paramSeleccion}{\\num{%g}}", b)
print sprintf("\\newcommand{\\paramBurbuja}{\\num{%g}}", c)
print sprintf("\\newcommand{\\paramShellsort}{\\num{%g}}", d)
print sprintf("\\newcommand{\\paramQuicksortPeor}{\\num{%g}}", e)
set print