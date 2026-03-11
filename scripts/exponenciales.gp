set title "Algoritmos Exponenciales" font ",16"
set xlabel "n" font ",12"
set ylabel "Tiempo (s)" font ",12"
set term pngcairo size 900,600 enhanced font "Sans,11"
set output "figures/exponenciales.png"
set logscale y
set format y "%.1e"
set fit logfile '/dev/null'
set grid
set key top left

set style line 1 lc rgb "#E74C3C" pt 7 ps 0.8 lw 2
set style line 2 lc rgb "#C0392B" lw 2 dt 2
set style line 3 lc rgb "#3498DB" pt 7 ps 0.8 lw 2
set style line 4 lc rgb "#2980B9" lw 2 dt 2

phi = (1 + sqrt(5)) / 2

f_hanoi(x) = a * 2**x
f_fibo(x) = b * phi**x

fit f_hanoi(x) 'data/hanoi.dat' via a
fit f_fibo(x) 'data/fibonacci.dat' via b

plot 'data/hanoi.dat'    with points ls 1 title 'Datos Hanoi', \
     f_hanoi(x)          with lines  ls 2 title 'Ajuste Hanoi (2^n)', \
     'data/fibonacci.dat' with points ls 3 title 'Datos Fibonacci', \
     f_fibo(x)           with lines  ls 4 title 'Ajuste Fibonacci (φ^n)'