#GNUPLOT file
set terminal svg
set out "ratio-linear.svg"
set yrange [0.6:1.0]
set xrange [0:50]
set border 0
set mxtics 5
set nokey

set multiplot
plot "ratio-linear.plot.data" using 1:2 \
     title "Annulus Correction, Small Circles (Linear)" \
     with lines lt -1 lc rgb "red"
