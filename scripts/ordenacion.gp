# script para graficar la comparativa global de algoritmos de ordenación
# autor: Juan Ignacio Molina

# configurar formato de exportado y tamaño
set terminal pdfcairo size 5, 4.8 enhanced font "Latin Modern Roman,12" \
    background "#ffffff"

set output "figures/comparativa_ordenacion.pdf"

# titulos
set title  "Comparativa global de algoritmos de ordenación" font "Latin Modern Roman Bold,17" \
    offset 0,0.8
set xlabel "n"          font "Latin Modern Roman,13" offset 0,-0.5
set ylabel "Tiempo (s)" font "Latin Modern Roman,13" offset -1,0

# ejes y escala
set logscale y
set format x "10^{%L}"
set xtics font "Latin Modern Roman,11"
set ytics font "Latin Modern Roman,11"
set xrange [6000:250000]

# margenes
set lmargin 10
set rmargin  6
set tmargin  4
set bmargin  12

# bordes
set border 3 lw 1.2 lc rgb "#555555"
set tics nomirror

# cuadricula
set grid xtics ytics lt 0 lc rgb "#CCCCBB" lw 0.8

# clave
set key below maxrows 4 maxcols 3 spacing 1.3 font "Latin Modern Roman,10.5" \
    box lc rgb "#AAAAAA" lw 0.8 samplen 3

# estilos — cuadráticos
set style line 1  lc rgb "#C0392B" pt 6  ps 0.6 lw 1.5   # inserción
set style line 2  lc rgb "#2471A3" pt 4  ps 0.6 lw 1.5   # selección
set style line 3  lc rgb "#1A7A6E" pt 8  ps 0.6 lw 1.5   # burbuja
set style line 4  lc rgb "#7D3C98" pt 10 ps 0.6 lw 1.5   # shellsort
set style line 5  lc rgb "#7D3C98" pt 11 ps 0.6 lw 1.5   # shellsort peor
set style line 6  lc rgb "#CA6F1E" pt 12 ps 0.6 lw 1.5   # quicksort peor

# estilos — loglineales
set style line 7  lc rgb "#C0392B" pt 7  ps 0.6 lw 1.5   # mergesort
set style line 8  lc rgb "#2471A3" pt 5  ps 0.6 lw 1.5   # heapsort
set style line 9  lc rgb "#2471A3" pt 4  ps 0.6 lw 1.5   # heapsort peor
set style line 10 lc rgb "#CA6F1E" pt 13 ps 0.6 lw 1.5   # quicksort promedio

# graficar
plot \
  'data/insercion.dat'       every ::1 u 1:2 w points ls 1  title 'Inserción', \
  'data/seleccion.dat'       every ::1 u 1:2 w points ls 2  title 'Selección', \
  'data/burbuja.dat'         every ::1 u 1:2 w points ls 3  title 'Burbuja', \
  'data/shellsort.dat'       every ::1 u 1:2 w points ls 4  title 'Shellsort', \
  'data/shellsort_peor.dat'  every ::1 u 1:2 w points ls 5  title 'Shellsort (peor caso)', \
  'data/quicksort_peor.dat'  every ::1 u 1:2 w points ls 6  title 'Quicksort (peor caso)', \
  'data/mergesort_pequeno.dat'       every ::1 u 1:2 w points ls 7  title 'Mergesort', \
  'data/heapsort_pequeno.dat'        every ::1 u 1:2 w points ls 8  title 'Heapsort', \
  'data/heapsort_peor.dat'   every ::1 u 1:2 w points ls 9  title 'Heapsort (peor caso)', \
  'data/quicksort_pequeno.dat'       every ::1 u 1:2 w points ls 10 title 'Quicksort (promedio)'