# script para graficar la eficiencia de algoritmos loglineales
# autor: Juan Ignacio Molina

# configurar formato de exportado y tamaño
set terminal pdfcairo size 5, 3.6 enhanced font "Latin Modern Roman,12" \
    background "#ffffff"

set output "figures/logaritmicos.pdf"

# titulos
set title  "Algoritmos log-lineales" font "Latin Modern Roman Bold,17" \
    offset 0,0.8
set xlabel "n"          font "Latin Modern Roman,13" offset 0,-0.5
set ylabel "Tiempo (s)" font "Latin Modern Roman,13" offset -1,0

# ejes y escala
# set logscale y
#set format y "10^{%L}"      # clean superscript notation
set xtics font "Latin Modern Roman,11"
set ytics font "Latin Modern Roman,11"

# margenes
set lmargin 10
set rmargin  6
set tmargin  4
set bmargin  5

# bordes
set border 3 lw 1.2 lc rgb "#555555"
set tics nomirror

# cuadricula
set grid xtics ytics lt 0 lc rgb "#CCCCBB" lw 0.8   # subtle dotted

# clave
set key top left spacing 1.4 font "Latin Modern Roman,11" \
    box lc rgb "#AAAAAA" lw 0.8 samplen 3.5

# estilos de puntos y lineas
# mergesort
set style line 1 lc rgb "#C0392B" pt 6  ps 0.5 lw 1.5   # círculo hueco
set style line 2 lc rgb "#E05C4B" lw 2.2 dt (10,4)

# mergesort_peor
set style line 3 lc rgb "#E8797A" pt 7  ps 0.5 lw 1.5   # círculo relleno
set style line 4 lc rgb "#F0AAAB" lw 2.2 dt (4,4)

# heapsort
set style line 5 lc rgb "#1A7A6E" pt 8  ps 0.5 lw 1.5   # triángulo arriba hueco
set style line 6 lc rgb "#45A899" lw 2.2 dt (10,4)

# quicksort
set style line 7 lc rgb "#7D3C98" pt 10 ps 0.5 lw 1.5   # triángulo abajo hueco
set style line 8 lc rgb "#A569BD" lw 2.2 dt (10,4)


# ajuste
set fit logfile '/dev/null' quiet

f_merge(x) =      a * x * log(x)
f_merge_peor(x) = b * x * log(x)
f_heap(x) =       c * x * log(x)
f_quick(x) =      d * x * log(x)

fit f_merge(x)      'data/mergesort.dat'       every ::1 via a
fit f_merge_peor(x) 'data/mergesort_peor.dat'  every ::1 via b
fit f_heap(x)       'data/heapsort.dat'        every ::1 via c
fit f_quick(x)      'data/quicksort.dat'       every ::1 via d


# graficar
plot \
  'data/mergesort.dat'       every ::1 u 1:2 w points ls 1 title 'Mergesort', \
  f_merge(x)                 w lines ls 2 title 'Ajuste Mergesort', \
  'data/mergesort_peor.dat'  every ::1 u 1:2 w points ls 3 title 'Mergesort (peor caso)', \
  f_merge_peor(x)            w lines ls 4 title 'Ajuste Mergesort (peor caso)', \
  'data/heapsort.dat'        every ::1 u 1:2 w points ls 5 title 'Heapsort', \
  f_heap(x)                  w lines ls 6 title 'Ajuste Heapsort', \
  'data/quicksort.dat'       every ::1 u 1:2 w points ls 7 title 'Quicksort', \
  f_quick(x)                 w lines ls 8 title 'Ajuste Quicksort' \


# guardar ajuste
set print "./memoria/params_logaritmicos.tex"
print sprintf("\\newcommand{\\paramMergesort}{\\num{%g}}", a)
print sprintf("\\newcommand{\\paramMergesortPeor}{\\num{%g}}", b)
print sprintf("\\newcommand{\\paramHeapsort}{\\num{%g}}", c)
print sprintf("\\newcommand{\\paramQuicksort}{\\num{%g}}", d)
set print