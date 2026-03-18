# script para mostrar la inadecuación del ajuste n^2 para shellsort
# autor: Juan Ignacio Molina


# configurar formato de exportado y tamaño
set terminal pdfcairo size 5, 3.6 enhanced font "Latin Modern Roman,12" \
    background "#ffffff"

set output "figures/shellsort.pdf"

# titulos
set title  "Comparativa de ajustes para shellsort" font "Latin Modern Roman Bold,17" \
    offset 0,0.8
set xlabel "n"          font "Latin Modern Roman,13" offset 0,-0.5
set ylabel "Tiempo (s)" font "Latin Modern Roman,13" offset -1,0

# ejes y escala
set format y "10^{%L}"
set format x "10^{%L}"
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
set key top left spacing 1.3 font "Latin Modern Roman,11" \
    box lc rgb "#AAAAAA" lw 0.8 samplen 3.5

# estilos de puntos y lineas
# datos
set style line 1 lc rgb "#7D3C98" pt 10 ps 0.7 lw 1.5
# ajuste cuadratico
set style line 2 lc rgb "#C0392B" lw 2.2 dt (10,4)
# ajuste libre
set style line 3 lc rgb "#2471A3" lw 2.2 dt (10,4)

# ajuste
set fit logfile '/dev/null' quiet

f_teorico(x) = a * x**2
f_libre(x)   = b * x**alpha

a     = 1e-9
b     = 1e-9
alpha = 1.5

fit f_teorico(x) 'data/shellsort.dat' every ::1 via a
fit f_libre(x)   'data/shellsort.dat' every ::1 via b, alpha

# calcular R^2
stats 'data/shellsort.dat' every ::1 using 2 nooutput
ss_mean = STATS_mean

stats 'data/shellsort.dat' every ::1 using (($2 - f_teorico($1))**2) nooutput
ss_res_teo = STATS_sum
stats 'data/shellsort.dat' every ::1 using (($2 - ss_mean)**2) nooutput
ss_tot = STATS_sum
r2_teorico = 1 - ss_res_teo / ss_tot

stats 'data/shellsort.dat' every ::1 using (($2 - f_libre($1))**2) nooutput
ss_res_lib = STATS_sum
r2_libre = 1 - ss_res_lib / ss_tot

# graficar
plot 'data/shellsort.dat' every ::1 u 1:2 with points ls 1 \
         title 'Shellsort (datos)', \
     f_teorico(x) with lines ls 2 \
         title sprintf('Ajuste x^2  (R^2=%.4f)', r2_teorico), \
     f_libre(x)   with lines ls 3 \
         title sprintf('Ajuste x^{%.3f}  (R^2=%.4f)', alpha, r2_libre)

# guardar parametros
set print "./memoria/params_shellsort_hibrido.tex"
print sprintf("\\newcommand{\\paramShellsortTeorico}{\\num{%g}}", a)
print sprintf("\\newcommand{\\paramShellsortLibre}{\\num{%g}}", b)
print sprintf("\\newcommand{\\alphaShellsort}{\\num{%.4f}}", alpha)
print sprintf("\\newcommand{\\rDosShellsortTeorico}{\\num{%.6f}}", r2_teorico)
print sprintf("\\newcommand{\\rDosShellsortLibre}{\\num{%.6f}}", r2_libre)
set print