# script para graficar la eficiencia de algoritmos cuadráticos
# autor: Juan Ignacio Molina


set title "Algoritmos Cuadráticos" font ",16"
set xlabel "n" font ",12"
set ylabel "Tiempo (s)" font ",12"


set terminal pdfcairo size 5, 3.6 enhanced font "Latin Modern Roman,12" \
    background "#FAFAF8"

set output "figures/cuadraticos.pdf"


set format y "%.1e"
set fit logfile '/dev/null'
set grid
set key top left

set style line 1 lc rgb "#E74C3C" pt 7 ps 0.8 lw 2
set style line 2 lc rgb "#C0392B" lw 2 dt 2
set style line 3 lc rgb "#3498DB" pt 7 ps 0.8 lw 2
set style line 4 lc rgb "#2980B9" lw 2 dt 2
set style line 5 lc rgb "#21ab2f" pt 7 ps 0.8 lw 2
set style line 6 lc rgb "#1d8931" lw 2 dt 2
set style line 7 lc rgb "#dc3db1" pt 7 ps 0.8 lw 2
set style line 8 lc rgb "#b41b92" lw 2 dt 2
set style line 9 lc rgb "#c3df67" pt 7 ps 0.8 lw 2
set style line 10 lc rgb "#d27614" lw 2 dt 2

f_insercion(x) =         a * x*x
f_seleccion(x) =         b * x*x
f_burbuja(x) =           c * x*x
f_shellsort(x) =         d * x*x
f_quicksort_peor(x) =    e * x*x

fit f_insercion(x) 'data/insercion.dat' every ::1 via a
fit f_seleccion(x) 'data/seleccion.dat' every ::1 via b
fit f_burbuja(x) 'data/burbuja.dat' every ::1 via c
fit f_shellsort(x) 'data/shellsort.dat' every ::1 via d
fit f_quicksort_peor(x) 'data/quicksort_peor.dat' every ::1 via e

plot 'data/insercion.dat'     every ::1 with points ls 1 title 'Datos Inserción', \
     f_insercion(x)           with lines  ls 2 title 'Ajuste Inserción', \
     'data/seleccion.dat'     every ::1 with points ls 3 title 'Datos Selección', \
     f_seleccion(x)           with lines  ls 4 title 'Ajuste Selección', \
     'data/burbuja.dat'       every ::1 with points ls 5 title 'Datos Burbuja', \
     f_burbuja(x)             with lines  ls 6 title 'Ajuste Burbuja', \
     'data/shellsort.dat'     every ::1 with points ls 7 title 'Datos Shellsort', \
     f_shellsort(x)           with lines  ls 8 title 'Ajuste Shellsort', \
     'data/quicksort_peor.dat' every ::1 with points ls 9 title 'Datos Quicksort (peor caso)', \
     f_quicksort_peor(x)      with lines ls 10 title 'Ajuste Quicksort (peor caso)'

# guardar ajuste
set print "./memoria/params_cuadraticos.tex"
print sprintf("\\newcommand{\\paramInsercion}{\\num{%g}}", a)
print sprintf("\\newcommand{\\paramSeleccion}{\\num{%g}}", b)
print sprintf("\\newcommand{\\paramBurbuja}{\\num{%g}}", c)
print sprintf("\\newcommand{\\paramShellsort}{\\num{%g}}", d)
print sprintf("\\newcommand{\\paramQuicksortPeor}{\\num{%g}}", e)
set print