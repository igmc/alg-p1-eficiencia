# configurar formato de exportado y tamaño

set terminal pdfcairo size 5, 3.6 enhanced font "Latin Modern Roman,12" \
    background "#FAFAF8"

set output "figures/logaritmicos.pdf"

# titulos
set title  "Algoritmos O(n log n)" font "Latin Modern Roman Bold,17" \
    offset 0,0.8
set xlabel "n"          font "Latin Modern Roman,13" offset 0,-0.5
set ylabel "Tiempo (s)" font "Latin Modern Roman,13" offset -1,0

# ejes y escala
set logscale y
set format y "10^{%L}"      # clean superscript notation
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
set style line 1 lc rgb "#C0392B" pt 6 ps 0.5 lw 1.5   # hollow circle
set style line 2 lc rgb "#E05C4B" lw 2.2 dt (10,4)

# mergesort_peor
set style line 3 lc rgb "#2471A3" pt 8 ps 0.5 lw 1.5   # hollow square
set style line 4 lc rgb "#5499C7" lw 2.2 dt (10,4)

# heapsort
set style line 5 lc rgb "#2471A3" pt 8 ps 0.5 lw 1.5   # hollow square
set style line 6 lc rgb "#5499C7" lw 2.2 dt (10,4)

# quicksort
set style line 7 lc rgb "#2471A3" pt 8 ps 0.5 lw 1.5   # hollow square
set style line 8 lc rgb "#5499C7" lw 2.2 dt (10,4)


# ajuste
set fit logfile '/dev/null' quiet
f_merge(x) = a * log(x)
f_merge_peor(x) = b * log(x)
f_heap(x) = c * log(x)
f_quick(x) = d * log(x)
fit f_merge(x) 'data/mergesort.dat'      every ::1 via a
fit f_merge_peor(x)  'data/mergesort_peor.dat'  every ::1 via b
fit f_heap(x)  'data/heapsort.dat'  every ::1 via c
fit f_quick(x)  'data/quicksort.dat'  every ::1 via d


# graficar
plot \
  'data/mergesort.dat' every ::1 u 1:2 w points ls 1 title 'Mergesort (datos)', \
  f_merge(x)                 w lines  ls 2 title 'Ajuste Mergesort', \
  'data/mergesort_peor.dat' every ::1 u 1:2 w points ls 3 title 'Mergesort (peor caso) (datos)', \
  f_merge_peor(x)                  w lines  ls 4 title 'Ajuste Mergesort (peor caso)', \
  'data/heapsort.dat' every ::1 u 1:2 w points ls 5 title 'Heapsort (datos)', \
  f_heap(x)                  w lines  ls 6 title 'Ajuste Heapsort', \
  'data/quicksort.dat' every ::1 u 1:2 w points ls 7 title 'Quicksort (datos)', \
  f_quick(x)                  w lines  ls 8 title 'Ajuste Quicksort', \


# guardar ajuste
set print "./memoria/params_logaritmicos.tex"
print sprintf("\\newcommand{\\paramMergesort}{\\num{%g}}", a)
print sprintf("\\newcommand{\\paramMergesortPeor}{\\num{%g}}", b)
print sprintf("\\newcommand{\\paramHeapsort}{\\num{%g}}", c)
print sprintf("\\newcommand{\\paramQuicksort}{\\num{%g}}", d)
set print