# script para graficar la eficiencia de algoritmos exponenciales
# autor: Juan Ignacio Molina

# configurar formato de exportado y tamaño

set terminal pdfcairo size 5, 3.6 enhanced font "Latin Modern Roman,12" \
    background "#ffffff"

set output "figures/exponenciales.pdf"

# titulos
set title  "Algoritmos Exponenciales" font "Latin Modern Roman Bold,17" \
    offset 0,0.8
set xlabel "n"          font "Latin Modern Roman,13" offset 0,-0.5
set ylabel "Tiempo (s)" font "Latin Modern Roman,13" offset -1,0

# ejes y escala
set logscale y
set format y "10^{%L}"
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
# hanoi
set style line 1 lc rgb "#C0392B" pt 6 ps 0.5 lw 1.5   # hollow circle
set style line 2 lc rgb "#E05C4B" lw 2.2 dt (10,4)

# fibonacci
set style line 3 lc rgb "#2471A3" pt 8 ps 0.5 lw 1.5   # hollow square
set style line 4 lc rgb "#5499C7" lw 2.2 dt (10,4)

# ajuste
set fit logfile '/dev/null' quiet
phi = (1 + sqrt(5)) / 2
f_hanoi(x) = a * 2.0**x
f_fibo(x)  = b * phi**x
fit f_hanoi(x) 'data/hanoi.dat'      every ::1 via a
fit f_fibo(x)  'data/fibonacci.dat'  every ::1 via b

# graficar
plot \
  'data/hanoi.dat' every ::1 u 1:2 w points ls 1 title 'Hanoi', \
  f_hanoi(x)                 w lines  ls 2 title 'Ajuste Hanoi  2^n', \
  'data/fibonacci.dat' every ::1 u 1:2 w points ls 3 title 'Fibonacci', \
  f_fibo(x)                  w lines  ls 4 title 'Ajuste Fibonacci  {/Symbol j}^n'

# guardar ajuste
set print "./memoria/params_exponenciales.tex"
print sprintf("\\newcommand{\\paramHanoi}{\\num{%g}}", a)
print sprintf("\\newcommand{\\paramFibonacci}{\\num{%g}}", b)
set print