#GNUPLOT file
set terminal svg
set out "ratio-logarithmic.svg"
set logscale x 2
set yrange [0.6:1.0]
set xrange [1.0:1200000000000000000.0]
set format x "2^{%L}"
set border 0
set nokey

set multiplot
plot "ratio-logarithmic.plot.data" using 1:2 \
     title "Annulus Correction, Small Circles (Logarithmic)" \
     with lines lt -1 lc rgb "red"
