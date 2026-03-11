set title "Torres de hanoi"
set term pngcairo
set output "figures/hanoi.png"

f_hanoi(x) = a * 2**x
fit f_hanoi(x) 'data/hanoi.dat' via a
plot 'data/hanoi.dat' with points title 'Datos Hanoi', \
     f_hanoi(x) with lines title 'Ajuste Hanoi'