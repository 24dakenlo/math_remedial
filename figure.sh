#!/bin/sh

gnuplot <<EOF
set output "Cchange.eps"
set terminal postscript eps enhanced 20
set size 0.6,0.7
unset border
set style line 1 lt 1 lw 3 pt 0
set style line 2 lt 2 lw 2 pt 0
set grid ls 2
set pointsize 2.0
set zeroaxis ls 1
set xtics axis nomirror in ("t_h" 0.693, "2t_h" 1.386, "3t_h" 2.079)
set ytics axis nomirror in ("C_0" 1, "C_0/2" 0.5, "C_0/4" 0.25, "C_0/8" 0.125)
set xrange [0:2.5]
set yrange [0:1.3]
set arrow from 0,0 to 2.5,0 ls 1
set arrow from 0,0 to 0,1.3 ls 1
set label "t" at 2.5,-0.1 font "Times-Italic,25"
set label "C" at -0.15,1.3 font "Times-Italic,25"
set label "O" at -0.15,-0.07
unset key
plot exp(-x) w l ls 1
EOF



#E=41200
#A=5.51E9
gnuplot <<EOF
set output "Arrhenius.eps"
set terminal postscript eps enhanced 20
set size 0.6,1.2
R=1.987
T1=550.0
T2=850.0

E=41500
A=4.5E9

set multiplot
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0

set origin 0.0,0.65; set size 0.6,0.55
set xrange [T1:T2]
set ylabel "{/Times-Italic k} / (L mol^{-1} s^{-1})"
set xlabel "{/Times-Italic T} / K"
plot A*exp(-E/(R*x)) w l ls 2 noti
set arrow from 0.00125,2 to 0.00182,-0.8 ls 3
set arrow from 0.00182,2 to 0.00118,-0.8 ls 3

set origin 0.0,0.0; set size 0.6,0.6
set xrange [1/T2:1/T1]
set xtics 0.0002
set mxtics 0.0001
set ylabel "log_{10} [{/Times-Italic k} / (L mol^{-1} s^{-1})]"
set xlabel "K/{/Times-Italic T}"
set grid
plot log(A*exp(-E*x/(R)))/log(10) noti
set arrow from 0,0 to 0.5,10.5 ls 1

EOF




gnuplot <<EOF
set output "const.eps"
set terminal postscript eps enhanced 17
set size 0.5,0.4
set size ratio -1
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set xrange [-2.8:2.8]; 
set yrange [-0.8:2.3]
set arrow from 0,0 to 2.8 ls 1
set arrow from 0,0 to 0,2.5 ls 1
set nokey
set label "O" at -0.4,-0.35
set label "x" at 2.9,-0.3 font "Times-Italic,22"
set label "y" at 0.2,2.3 font "Times-Italic,22"
unset key
plot 0.0001*x+1 w l ls 2
EOF


gnuplot <<EOF
set output "proportion.eps"
set terminal postscript eps enhanced 17
set size 0.6,0.43
unset border
set multiplot
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set xrange [-2.5:2.5]; 
set yrange [-2.5:2.5]
set arrow from 0,0 to 2.5,0
set arrow from 0,0 to 0,2.5
set nokey
set label "O" at -0.4,-0.35
set label "x" at 2.5,-0.4 font "Times-Italic,20"
set label "y" at -0.6,2.7 font "Times-Italic,20"
unset key

set origin 0.0,0.0; set size 0.3,0.43
set title offset -5,0 "y= 2x"
plot 2*x w l ls 2

set origin 0.3,0.0; set size 0.3,0.43
set title offset -5,0 "y= -2x"
plot -2*x w l ls 2
EOF


gnuplot <<EOF
set output "parab.eps"
set terminal postscript eps enhanced 17
set size 0.4,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0
set grid ls 3
set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("1" 1, "2" 2, "3" 3, "4" 4)
set xrange [-2.4:2.4]; 
set yrange [-0.5:4.5]
set arrow from 0,0 to 2.8
set arrow from 0,0 to 0,4.5
set nokey
set label "O" at -0.4,-0.35
set label "x" at 2.5,-0.3 font "Times-Italic,20"
set label "y" at -0.5,4.5 font "Times-Italic,20"
unset key
plot x*x w l ls 2
EOF


gnuplot <<EOF
set output "inverse.eps"
set terminal postscript eps enhanced 17
set size 0.5,0.6
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0
set grid ls 3
set zeroaxis ls 1
set xtics axis nomirror in ("-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3)
set ytics axis nomirror in ("-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3)
set xrange [-3.4:3.4]; 
set yrange [-3.4:3.4]
set arrow from 0,0 to 3.4
set arrow from 0,0 to 0,3.4
set nokey
set label "O" at -0.4,-0.35
set label "x" at 3.4,-0.4 font "Times-Italic,20"
set label "y" at -0.4,3.6 font "Times-Italic,20"
unset key
plot 1/x w l ls 2
EOF











gnuplot <<EOF
set output "parab_inverse.eps"
set terminal postscript eps enhanced 19
set size 1.0,0.7
#set size ratio -1 
unset border
set multiplot
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0

set grid ls 3
set zeroaxis ls 1
set xtics axis nomirror in ("-4" -4, "-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4)
set ytics axis nomirror in ("-4" -4, "-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4)
set xrange [-4.4:4.4]; 
set yrange [-4.4:4.4]
set arrow from 0,0 to 4.4
set arrow from 0,0 to 0,4.5
set nokey
set label "O" at -0.4,-0.35
set label "x" at 4.5,-0.3 font "Times-Italic,24"
set label "y" at 0.2,4.5 font "Times-Italic,24"
unset key

set origin 0.0,0.0; set size 0.48,0.7
set title offset -2,0 "y=x^2"
plot x*x w l ls 2

set origin 0.5,0.0; set size 0.48,0.7
set title offset -2,0 "y=1/x"
plot 1/x w l ls 2
EOF






gnuplot <<EOF
set terminal postscript eps enhanced 17
set output "basic_graph.eps"
set size 0.7,1.5
unset border
set multiplot
unset key
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 4 pt 0
set style line 3 lt 2 lw 2 pt 0
set style line 4 lt 3 lw 1 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3)
set ytics axis nomirror in ("-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3)
set xrange [-3.4:3.4]; 
set yrange [-3.4:3.4]
set arrow from 0,0 to 3.4
set arrow from 0,0 to 0,3.4
set label "O" at -0.4,-0.35
set label "x" at 3.4,-0.4 font "Times-Italic,20"
set label "y" at -0.5,3.7 font "Times-Italic,20"

set origin 0.0,1.0; set size 0.37,0.5
set title offset -5,0 "y=2x-1 "
plot 2*x-1 ls 2, 2*x ls 3

set origin 0.35,1.0; set size 0.37,0.5
set title "y= x^2/4"
plot x*x/4 ls 2, x*x ls 3

set origin 0.0,0.5; set size 0.37,0.5
set title "y= -x^2"
plot -x*x ls 2, x*x ls 3

set origin 0.35,0.5; set size 0.37,0.5
set title "y= 2x^2+4x+1"
plot 2*x*x+4*x+1 ls 2, x*x ls 3

set origin 0.0,0.0; set size 0.37,0.5
set title "y= -1/x"
plot -1/x ls 2, 1/x ls 3

set origin 0.35,0.0; set size 0.37,0.5
set title "y=2/(x-1)+1"
set arrow nohead from -3.4,1 to 3.4,1 ls 4
set arrow nohead from 1,-3.4 to 1,3.4 ls 4
plot 2/(x-1)+1 ls 2, 1/x ls 3
EOF


gnuplot <<EOF
set terminal postscript eps enhanced 17
set output "x2_trans.eps"
set size 1.0,1.0
unset border
set multiplot
unset key
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 4 pt 0
set style line 3 lt 2 lw 2 pt 0
set style line 4 lt 3 lw 1 pt 0
set style line 5 lt 1 lw 10 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3)
set ytics axis nomirror in ("1" 1, "2" 2, "3" 3)
set xrange [-2.4:3.8]; 
set yrange [-0.4:3.4]
set label "O" at -0.4,-0.35
set label "x" at 3.8,-0.4 font "Times-Italic,20"

set arrow from 0,0 to 3.8
set arrow from 0,0 to 0,3.4
set arrow from 3.6,2 to 4.3,2 ls 5
set origin 0.0,0.5; set size 0.35,0.48
set title "y= x^2"
plot x*x ls 2

set origin 0.32,0.5; set size 0.35,0.48
set title "y=(x/2)^2"
plot x*x/4 ls 2, x*x ls 3

unset arrow
set arrow from 0,0 to 3.8
set arrow from 0,0 to 0,3.4
set origin 0.64,0.5; set size 0.35,0.48
set title "y=((x-1)/2)^2"
plot (x-1)*(x-1)/4 ls 2, x*x ls 3



set arrow from 0,0 to 3.8
set arrow from 0,0 to 0,3.4
set arrow from 3.6,2 to 4.3,2 ls 5
set origin 0.0,0.0; set size 0.35,0.48
set title "y= x^2"
plot x*x ls 2

set origin 0.32,0.0; set size 0.35,0.48
set title "y=(x-1)^2"
plot (x-1)*(x-1) ls 2, x*x ls 3

unset arrow
set arrow from 0,0 to 3.8
set arrow from 0,0 to 0,3.4
set origin 0.64,0.0; set size 0.35,0.48
set title "y=((x/2)-1)^2"
plot x*x/4-x+1 ls 2, x*x ls 3
EOF



gnuplot <<EOF
set output "x_plus_1_over_x.eps"
set terminal postscript eps enhanced 15
set size 0.6,0.6
set size ratio 1
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 2 lw 1 pt 0
set style line 4 lt 3 lw 2 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("1" 1, "2" 2, "3" 3)
set ytics axis nomirror in ("1" 1, "2" 2, "3" 3)
set xrange [-0.1:3.6]
set yrange [-0.1:3.6]
set arrow from 0,0 to 3.6,0
set arrow from 0,0 to 0,3.6
set key below
set label "O" at -0.3,-0.3
set label "x" at 3.6,-0.2 font "Times-Italic,20"
set label "y" at -0.6,3.6 font "Times-Italic,20"
plot x t "y=x" ls 3, 1/x t "y=1/x" ls 4, x+1/x t "y=x+1/x" ls 2
EOF


gnuplot <<EOF
set terminal postscript eps enhanced 18
set output "xxx-x.eps"
set size 0.4,0.65
unset border
unset key
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 4 pt 0
set style line 3 lt 3 lw 2 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-4" -4, "-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4)
set xrange [-2.4:2.4]
set yrange [-2.8:2.8]
set arrow from 0,0 to 2.4,0
set arrow from 0,0 to 0,2.8
set label "O" at -0.4,-0.5
set label "x" at 2.4,-0.2 font "Times-Italic,20"
set label "y" at -0.5,2.8 font "Times-Italic,20"
plot x*x*x-x ls 2, x*x*x ls 3, -x ls 3
EOF




gnuplot <<EOF
set output "2Dpoly_graph.eps"
set terminal postscript eps enhanced 19
set size 0.91,0.47
unset border
set multiplot
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set xrange [-2.5:2.5];
set yrange [-2.5:2.5]
set arrow from 0,0 to 2.5,0
set arrow from 0,0 to 0,2.5
set nokey
set label "O" at -0.5,-0.35
set label "x" at 2.5,-0.4 font "Times-Italic,22"
set label "y" at -0.6,2.7 font "Times-Italic,22"
unset key

set origin 0.0,0.0; set size 0.33,0.47
set title offset -2,0 "D<0: y=x^2+x+1"
plot x*x+x+1 w l ls 2

set origin 0.3,0.0; set size 0.33,0.47
set title offset -2,0 "D=0: y=x^2-2x+1"
plot x*x-2*x+1 w l ls 2

set origin 0.6,0.0; set size 0.33,0.47
set title offset -2,0 "D>0: y=x^2-x-2"
plot x*x-x-2 w l ls 2
EOF

gnuplot <<EOF
set terminal postscript eps enhanced 14
set output "2x_plus_1_etc.eps"
set size 0.6,0.9
unset border
set multiplot
unset key
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4)
set xrange [-2.8:3.5]
set yrange [-2.8:4.6]
set arrow from 0,0 to 3.5,0
set arrow from 0,0 to 0,4.6
set label "O" at -0.4,-0.35
set label "x" at 3.5,-0.2 font "Times-Italic,20"
set label "y" at -0.5,4.8 font "Times-Italic,20"

set origin 0.0,0.45; set size 0.32,0.47
set title offset -5,0 "y=2x+1"
plot 2*x+1 ls 2

set origin 0.3,0.45; set size 0.32,0.47
set title "y=x^2+2x+3"
plot x*x+2*x+3 ls 2

set origin 0.0,0.0; set size 0.32,0.47
set arrow nohead from -2.8,2 to 3.5,2 lt 2 lw 2
set title "y=2+1/x"
plot 2+1/x  ls 2

set origin 0.3,0.0; set size 0.32,0.47
set arrow nohead from -1,-3 to -1,5 lt 2 lw 2
set title offset -5,0 "y=2x/(1+x)"
plot 2*x/(1+x) ls 2
EOF


gnuplot <<EOF
set terminal postscript eps enhanced 16
set output "xxxx_minus_etc.eps"
set size 0.6,0.9
unset border
set multiplot
unset key
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3)
set ytics axis nomirror in ("-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3)
set xrange [-2.6:2.6]
set yrange [-2.6:2.6]
set arrow from 0,0 to 2.6,0
set arrow from 0,0 to 0,2.6
set label "O" at -0.4,-0.35
set label "x" at 2.6,-0.3 font "Times-Italic,20"
set label "y" at -0.6,2.8 font "Times-Italic,20"

set origin 0.0,0.45; set size 0.3,0.45
set title offset -5,0 "y=4x^4-5x^2+1"
plot 4*x*x*x*x-5*x*x+1 ls 2

set origin 0.3,0.45; set size 0.3,0.45
set title "y=x+x^2"
plot x*x+x ls 2

set origin 0.0,0.0; set size 0.3,0.45
set title offset -5,0 "y=x-x^3"
plot x-x*x*x ls 2

set origin 0.3,0.0; set size 0.3,0.45
set title offset -5,0 "y= 1/(1+x^2)"
plot 1/(1+x*x)  ls 2
EOF


gnuplot <<EOF
set output "xx_and_sqrt_x.eps"
set terminal postscript eps enhanced 20
set size ratio -1
set size 0.7,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 2 pt 0
set style line 3 lt 2 lw 3 pt 0
set style line 4 lt 3 lw 2 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("1" 1)
set ytics axis nomirror in ("1" 1)
set xrange [-0.5:1.9]
set yrange [-0.2:1.6]
set arrow from 0,0 to 1.9,0
set arrow from 0,0 to 0,1.6
set key rmargin
set label "O" at -0.25,-0.18
set label "x" at 1.9,-0.2 font "Times-Italic,22"
set label "y" at 0.1,1.5 font "Times-Italic,22"
plot x*x t "y=x^2" ls 2, sqrt(x) t "y=sqrt(x)" ls 3, x t "y=x" ls 4
EOF


gnuplot <<EOF
set output "x_or_xx_etc.eps"
set terminal postscript eps enhanced 20
set size ratio -1
set size 0.7,0.5
set origin 2.0,0.0
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 2 pt 0
set style line 3 lt 2 lw 1 pt 0
set style line 4 lt 3 lw 3 pt 0
set style line 5 lt 4 lw 3 pt 0
set style line 6 lt 5 lw 5 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("0.5" 0.5, "1" 1)
set ytics axis nomirror in ("0.5" 0.5, "1" 1)
set xrange [-0.05:1.05]
set yrange [-0.05:1.05]
set arrow from 0,0 to 1.1,0
set arrow from 0,0 to 0,1.1
set key rmargin
set label "O" at -0.1,-0.1
set label "x" at 1.1,-0.12 font "Times-Italic,24"
set label "y" at -0.2,1.1 font "Times-Italic,24"
plot x t "y=x" ls 2, x*x t "y=x^2, y=x^{1/2}" ls 3, x*x*x t "y=x^3, y=x^{1/3}" ls 4, x*x*x*x t "y=x^4, y=x^{1/4}" ls 5, \\
     sqrt(x) noti ls 3, exp(log(x)*0.3333) noti ls 4, sqrt(sqrt(x)) noti ls 5
EOF


gnuplot <<EOF
set output "xx_minus_yy_eq_1.eps"
set terminal postscript eps enhanced 22
set size ratio 1
set size 0.4,0.56
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 2.5 pt 0
set style line 3 lt 2 lw 1.8 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set xrange [-2.6:2.6]
set yrange [-2.6:2.6]
set arrow from 0,0 to 2.6,0
set arrow from 0,0 to 0,2.6
unset key
set label "O" at -0.4,-0.36
set label "x" at 2.5,-0.3 font "Times-Italic,25"
set label "y" at -0.5,2.6 font "Times-Italic,25"
set parametric
plot cosh(t),sinh(t) w l ls 2, -cosh(t),sinh(t) w l ls 2, t,t w l ls 3, -t,t w l ls 3
EOF


gnuplot <<EOF
set output "4xx_minus_yy_eq_1_etc.eps"
set terminal postscript eps enhanced 14
set size ratio 1 0.6,0.95
unset border
set multiplot
unset key
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 2 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-4" -4, "-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4)
set ytics axis nomirror in ("-4" -4, "-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4)
set xrange [-4.6:4.6]
set yrange [-4.6:4.6]
set arrow from 0,0 to 4.6,0
set arrow from 0,0 to 0,4.6
set label "O" at -0.5,-0.4
set label "x" at 4.5,-0.5 font "Times-Italic,20"
set label "y" at -0.8,4.8 font "Times-Italic,20"
unset key
set parametric
set origin 0.0,0.45; set size 0.3,0.45
set title offset -5,0 "x^2-y^2=-1"
plot sinh(t),cosh(t)  lt 1 lw 3, sinh(t),-cosh(t) lt 1 lw 3, \
     t,t ls 3, t,-t ls 3

set origin 0.3,0.45; set size 0.3,0.45
set title "4x^2-y^2=1"
plot cosh(t)/2,sinh(t) lt 1 lw 3, -cosh(t)/2,sinh(t) lt 1 lw 3, \\
     t,2*t ls 3, t,-2*t ls 3

set origin 0.0,0.0; set size 0.3,0.45
set title offset -5,0 "x^2-y^2=9"
plot 3*cosh(t),3*sinh(t) lt 1 lw 3, -3*cosh(t),3*sinh(t) lt 1 lw 3, \\
     t,t ls 3, t,-t ls 3

set origin 0.3,0.0; set size 0.3,0.45
set title "x^2+y^2/4=1"
plot cos(t),2*sin(t)  lt 1 lw 3
EOF



gnuplot <<EOF
set output "func_revfunc.eps"
set terminal postscript eps enhanced 22
set size ratio 1 0.6,0.6
unset border
unset key
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 5 pt 0
set style line 3 lt 1 lw 2 pt 0
set style line 4 lt 2 lw 2 pt 0

set zeroaxis ls 1
set xrange [-0.3:2.0]
set yrange [-0.3:2.0]
unset key
x0=0.8
x1=1.1
y0=tan(x0-0.3)+0.6
y1=tan(x1-0.3)+0.6

set arrow from 0,0 to 2,0
set arrow from 0,0 to 0,2
unset xtics
unset ytics
set label "x" at 2.0,-0.15 font "Times-Italic,24"
set label "y" at -0.18,2.0 font "Times-Italic,24"
set label "O" at -0.23,-0.2 font "Times-Italic,24"
set label "y=f(x)" at 1.04,2.1 font "Times-Italic,24"
set label "y=x" at 1.9,2.1 font "Times-Italic,24"
set label "x=f(y)" at 1.82,1.13 font "Times-Italic,24"
set label "y=g(x)" at 1.82,0.9 font "Times-Italic,24"
plot tan(x-0.3)+0.6 ls 2, atan(x-0.6)+0.3 ls 4, x ls 4
EOF

#---------------- end of chapter 2




gnuplot <<EOF
set output "diff_explain.eps"
set terminal postscript eps enhanced
set size 0.4,0.58
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 5 pt 0
set style line 3 lt 1 lw 2 pt 0
set style line 4 lt 2 lw 2 pt 0
set style line 5 lt 2 lw 4 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("x_0" 2, "x" 3)
set ytics axis nomirror in ("f(x_0)" 19, "f(x_0+{/Symbol D}x)" 30)
set xrange [-0.8:4.0]
set yrange [-5:45]
set arrow from 0,0 to 4.0,0
set arrow from 0,0 to 0,45.0
set arrow nohead from 2,0 to 2,19 ls 4
set arrow nohead from 3,0 to 3,30 ls 4
set arrow nohead from 0,19 to 3,19 ls 4
set arrow nohead from 0,30 to 3,30 ls 4
set arrow from 0.1,19 to 0.1,30 ls 1
set arrow from 2.0,1.2 to 3.0,1.2 ls 1

unset key
set label "x" at 4.0,-2 font "Times-Italic,20"
set label "y" at -0.4,45 font "Times-Italic,20"
set label "{/Symbol D}x" at 2.3,4
set label "{/Symbol D}f" at 0.25,24
set label "y=f(x)" at 2.9,44
set label "P" at 1.8,21
set label "Q" at 2.8,32
set label "Q'" at 3.05,24.5
set label "R" at 3.05,19
set label "=x_0+{/Symbol D}x" at 2.7,-6.5
plot (x-1)**3+4*x+10 t "y=f(x)" ls 2, \\
     11*(x-2)+19 t "y=f(x_0)+f'(x_0)(x-x_0)" ls 3, \\
     7*x+5 t "y=f(x_0)+f'(x_0)(x-x_0)" ls 5
EOF



cat << EOF >dummy1.txt
-0.2 0.5007 0.00447
0.6 0.583 0.457
1.0 1.0   1.5 
1.4 1.416 0.4575
2.0 1.497 0.0147
EOF
cat dummy1.txt | awk '{dx=0.6; print $1-dx,$2-$3*dx; print $1+dx,$2+$3*dx; print ""}' > dummy2.txt
gnuplot <<EOF
set output "diff_graph.eps"
set terminal postscript eps enhanced 30
set size ratio 1 1.0,2.0
unset border
set zeroaxis ls 1
set xrange [-0.5:2.5]
set yrange [-0.5:2.5]
set xtics axis nomirror in ("1" 1, "2" 2)
set ytics axis nomirror in ("1" 1, "2" 2)
set arrow from -0.5,0.0 to 2.5,0.0 ls 1
set arrow from 0.0,-0.5 to 0.0,2.5 ls 1
set label "x" at 2.5,-0.15 font "Times-Italic,32"
set label "y" at -0.18,2.5 font "Times-Italic,32"
set label "O" at -0.25,-0.2
set label "A" at -0.25,0.65
set label "B" at 0.5,0.75
set label "C" at 0.77,1.03
set label "D" at 1.35,1.23
set label "E" at 1.95,1.28
set label "y = f  x " at 2.0,2.1 font "Times-Italic,32"
set label " ( )" at 2.42,2.07
set multiplot
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 5 pt 0
set style line 3 lt 3 lw 2 pt 0
set style line 3 lt 2 lw 1 pt 0
set style line 5 lt 1 pt 7 ps 2
unset key
a=-6
b=1

x1=-0.2
y1=1/(1+exp(a*(x1-b)))+0.5

set origin 0.0,1.0; set size ratio 1 1.0,1.0
plot 1/(1+exp(a*(x-b)))+0.5 ls 2, \
     "dummy1.txt" u 1:2 w p ls 5, \
     "dummy2.txt" u 1:2 w l ls 3

unset label
set label "x" at 2.5,-0.15 font "Times-Italic,32"
set label "y" at -0.18,2.5 font "Times-Italic,32"
set label "O" at -0.25,-0.2
set label "A'" at -0.3,0.1
set label "B'" at 0.6,0.3
set label "C'" at 0.9,1.3
set label "D'" at 1.2,0.3
set label "E'" at 2.05,0.2
set label "y = f ' x " at 2.0,2.1 font "Times-Italic,32"
set label "  ( )" at 2.43,2.07
set arrow from -0.2,4.0 to -0.2,0.0 ls 4
set arrow from 0.6,4.083 to 0.6,0.457 ls 4
set arrow from 1.0,4.5   to 1.0,1.5  ls 4
set arrow from 1.4,4.916 to 1.4,0.4575 ls 4
set arrow from 2.0,4.997 to 2.0,0.0147 ls 4
set origin 0.0,0.0; set size ratio 1 1.0,1.0
plot -a/(2+exp(a*(x-b))+exp(-a*(x-b))) ls 2
EOF


gnuplot <<EOF
set output "diff_graph_ex.eps"
set terminal postscript eps enhanced 30
set size ratio 1 1.0,2.0
unset border
set zeroaxis ls 1
set xrange [-2.5:2.5]
set yrange [-2.5:2.5]
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set arrow from -0.5,0.0 to 2.5,0.0 ls 1
set arrow from 0.0,-0.5 to 0.0,2.5 ls 1
set label "x" at 2.5,-0.15 font "Times-Italic,32"
set label "y" at -0.25,2.5 font "Times-Italic,32"
set label "O" at -0.3,-0.2
set label "(1)" at -2.2,2.2
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 5 pt 0
set style line 3 lt 3 lw 2 pt 0
set style line 3 lt 2 lw 1 pt 0
set style line 5 lt 1 pt 7 ps 2
set multiplot
unset key
set origin 0.0,1.0; set size ratio 1 1.0,1.0
plot 3*exp(-2*x*x)-1 ls 2
unset label
set label "x" at 2.5,-0.15 font "Times-Italic,32"
set label "y" at -0.25,2.5 font "Times-Italic,32"
set label "O" at -0.3,-0.2
set label "(2)" at -2.2,2.2
set origin 0.0,0.0; set size ratio 1 1.0,1.0
plot (x-1.5)*(x+0.5) ls 2
EOF



gnuplot <<EOF
set output "tan_atan.eps"
set terminal postscript eps enhanced 26
set size ratio 1 1.05,0.7
unset border
set multiplot
unset key
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 5 pt 0
set style line 3 lt 1 lw 2 pt 0
set style line 4 lt 2 lw 2 pt 0

set zeroaxis ls 1
set xrange [-0.3:2.0]
set yrange [-0.3:2.0]
unset key
x0=0.8
x1=1.1
y0=tan(x0-0.3)+0.6
y1=tan(x1-0.3)+0.6

set origin 0.0,0.0; set size ratio 1 0.55,0.7
set arrow from 0,0 to 2,0
set arrow from 0,0 to 0,2
set xtics axis nomirror in ("x_0" x0, "" x1)
set ytics axis nomirror in ("y_0" y0, "" y1)
set arrow nohead from x0,0 to x0,y0 ls 4
set arrow nohead from x1,0 to x1,y1 ls 4
set arrow nohead from 0,y0 to x0,y0 ls 4
set arrow nohead from 0,y1 to x1,y1 ls 4
set arrow from 0.1,y0 to 0.1,y1 ls 1
set arrow from x0,0.1 to x1,0.1 ls 1
set label "x" at 2.0,-0.15 font "Times-Italic,28"
set label "y" at -0.18,2.0 font "Times-Italic,28"
set label "y=f(x)" at 1.1,2.1 font "Times-Italic,28"
set label "y=x" at 1.9,2.1 font "Times-Italic,28"
set label "y=g(x)" at 1.8,1.4 font "Times-Italic,28"
set label "{/Symbol D}x" at x0+0.05,0.25
set label "{/Symbol D}y" at 0.18,y0+0.25
set label "P" at x0-0.13,y0+0.13
set label "Q" at x1-0.13,y1+0.13
plot tan(x-0.3)+0.6 ls 2, atan(x-0.6)+0.3 ls 4, x ls 4

set origin 0.5,0.0; set size ratio 1 0.55,0.7
unset arrow
set arrow from 0,0 to 2,0
set arrow from 0,0 to 0,2
set xtics axis nomirror in ("y_0" y0, "" y1)
set ytics axis nomirror in ("x_0" x0, "" x1)
set arrow nohead from y0,0 to y0,x0 ls 4
set arrow nohead from y1,0 to y1,x1 ls 4
set arrow nohead from 0,x0 to y0,x0 ls 4
set arrow nohead from 0,x1 to y1,x1 ls 4
set arrow from 0.1,x0 to 0.1,x1 ls 1
set arrow from y0,0.1 to y1,0.1 ls 1
unset label
set label "x" at 2.0,-0.15 font "Times-Italic,28"
set label "y" at -0.18,2.0 font "Times-Italic,28"
set label "y=g(x)" at 1.73,1.4 font "Times-Italic,28"
set label "{/Symbol D}y" at y0+0.15,0.25
set label "{/Symbol D}x" at 0.18,x0+0.15
set label "R" at y0-0.15,x0+0.13
set label "S" at y1-0.15,x1+0.13
plot atan(x-0.6)+0.3 ls 2
EOF



cat <<EOF > dummy.txt
-3 3
0 0
3 3
EOF

gnuplot <<EOF
set terminal postscript eps enhanced 20
set size 0.445,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-1" -1, "1" 1, "2" 2)
set xrange [-2.5:2.5] 
set yrange [-1.5:2.5]
set arrow from 0,0 to 2.5,0
set arrow from 0,0 to 0,2.5
set nokey
set label "O" at -0.4,-0.3
set label "x" at 2.5,-0.3 font "Times-Italic,24"
set label "y" at -0.5,2.5 font "Times-Italic,24"
set output "abs_x.eps"
plot "dummy.txt" u 1:2 w l ls 2
EOF


cat <<EOF > dummy1.txt
-3 0
-0.1 0
EOF
cat <<EOF > dummy2.txt
0 1
3 1
EOF
cat <<EOF > dummy3.txt
0 0
EOF
cat <<EOF > dummy4.txt
0 1
EOF
gnuplot <<EOF
set terminal postscript eps enhanced 20
set size 0.445,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 5 pt 0
set style line 3 lt 3 lw 1 pt 0
set style line 4 lt 3 lw 1 pt 6 ps 2
set style line 5 lt 3 lw 1 pt 7 ps 2
set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-1" -1, "1" 1, "2" 2)
set xrange [-2.5:2.5] 
set yrange [-1.5:2.5]
set arrow from 0,0 to 2.5,0
set arrow from 0,0 to 0,2.5
set nokey
set label "O" at -0.4,-0.3
set label "x" at 2.5,-0.3 font "Times-Italic,24"
set label "y" at -0.5,2.5 font "Times-Italic,24"
set output "step_func01.eps"
plot "dummy1.txt" u 1:2 w l ls 2, "dummy2.txt" u 1:2 w l ls 2, "dummy3.txt" u 1:2 w p ls 4, "dummy4.txt" u 1:2 w p ls 5
EOF

echo dummy | awk '{for (x=-3; x<-0.1; x=x+0.05) print x, -exp(log(-x)/3)}' > dummy.txt
echo dummy | awk '{for (x=-0.1; x<0; x=x+0.005) print x, -exp(log(-x)/3)}' >> dummy.txt
echo dummy | awk '{for (x=0; x<=0.1; x=x+0.005) print x, exp(log(x)/3)}' >> dummy.txt
echo dummy | awk '{for (x=0.1; x<=3; x=x+0.05) print x, exp(log(x)/3)}' >> dummy.txt
gnuplot <<EOF
set terminal postscript eps enhanced 20
set size 0.445,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 4 pt 0
set style line 3 lt 3 lw 1 pt 0
set style line 4 lt 3 lw 1 pt 6 ps 2
set style line 5 lt 3 lw 1 pt 7 ps 2
set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-1" -1, "1" 1, "2" 2)
set xrange [-2.5:2.5] 
set yrange [-1.5:2.5]
set arrow from 0,0 to 2.5,0
set arrow from 0,0 to 0,2.5
set nokey
set label "O" at -0.4,-0.3
set label "x" at 2.5,-0.3 font "Times-Italic,24"
set label "y" at -0.5,2.5 font "Times-Italic,24"
set output "xpow1_3.eps"
plot "dummy.txt" u 1:2 w l ls 2
EOF


echo dummy | awk '{for (x=-3; x<-1; x=x+0.02) print x, x*x-1}' > dummy.txt
echo dummy | awk '{for (x=-1; x<=1; x=x+0.02) print x, 1-x*x}' >> dummy.txt
echo dummy | awk '{for (x=1;   x<3; x=x+0.02) print x, x*x-1}' >> dummy.txt
gnuplot <<EOF
set terminal postscript eps enhanced
set size 0.445,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 4 pt 0
set style line 3 lt 3 lw 1 pt 0
set style line 4 lt 3 lw 1 pt 6 ps 2
set style line 5 lt 3 lw 1 pt 7 ps 2
set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-1" -1, "1" 1, "2" 2)
set xrange [-2.5:2.5] 
set yrange [-1.5:2.5]
set arrow from 0,0 to 2.5,0
set arrow from 0,0 to 0,2.5
set nokey
set label "O" at -0.4,-0.3
set label "x" at 2.5,-0.3 font "Times-Italic,20"
set label "y" at -0.5,2.5 font "Times-Italic,20"
set output "abs_xx_1.eps"
plot "dummy.txt" u 1:2 w l ls 2
EOF

echo dummy | awk '{for (x=-3; x<-1; x=x+0.02) print x, 1/(1-x*x)}' > dummy1.txt
echo dummy | awk '{for (x=-1.02; x<1; x=x+0.02) print x, 1/(1-x*x)}' > dummy2.txt
echo dummy | awk '{for (x=1.02; x<3; x=x+0.02) print x, 1/(1-x*x)}' > dummy3.txt
gnuplot <<EOF
set terminal postscript eps enhanced
set size 0.445,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 4 pt 0
set style line 3 lt 3 lw 1 pt 0
set style line 4 lt 3 lw 1 pt 6 ps 2
set style line 5 lt 3 lw 1 pt 7 ps 2
set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-1" -1, "1" 1, "2" 2)
set xrange [-2.5:2.5] 
set yrange [-1.5:2.5]
set arrow from 0,0 to 2.5,0
set arrow from 0,0 to 0,2.5
set nokey
set label "O" at -0.4,-0.3
set label "x" at 2.5,-0.3 font "Times-Italic,20"
set label "y" at -0.5,2.5 font "Times-Italic,20"
set output "1_1_xx.eps"
plot "dummy1.txt" u 1:2 w l ls 2, "dummy2.txt" u 1:2 w l ls 2, "dummy3.txt" u 1:2 w l ls 2
EOF





#-----------
gnuplot <<EOF
set output "xxxx_xx.eps"
set terminal postscript eps enhanced 20
set size 0.6,0.6
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 2 lw 1.5 pt 0
set style line 4 lt 3 lw 2 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-1" -1, "1" 1, "2" 2, "3" 3)
set xrange [-1.5:1.5]
set yrange [-1.1:1.6]
set arrow from 0,0 to 1.6,0
set arrow from 0,0 to 0,1.6
set arrow from 0.707,0 to 0.707,-0.25 nohead ls 3
set arrow from -0.707,0 to -0.707,-0.25 nohead ls 3
set arrow from -0.707,-0.25 to 0.707,-0.25 nohead ls 3
unset key
set label "O" at -0.15,-0.15
set label "-1/4" at -0.3,-0.35
#set label "1/sqrt(2)" at 0.4,0.2
#set label "-1/sqrt(2)" at -1,0.2
set label "x" at 1.4,-0.2 font "Times-Italic,24"
set label "y" at -0.2,1.6 font "Times-Italic,24"
plot x*x*x*x-x*x ls 2
EOF
# You need to add 1/sqrt{2} by using inkscape



cat <<EOF > dummy.txt
-4.7123 -2.5
-4.7123  2.5

-1.5707  2.5
-1.5707 -2.5

 1.5707 -2.5
 1.5707  2.5

 4.7123  2.5
 4.7123 -2.5
EOF

gnuplot <<EOF
set terminal postscript eps enhanced
set size 0.5,0.3
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 2 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2{/Symbol p}" -6.28, "-{/Symbol p}" -3.14, "{/Symbol p}" 3.14, "2{/Symbol p}" 6.28)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set xrange [-7:7]; 
set yrange [-1.5:1.5]
set arrow from 0,0 to 7,0
set arrow from 0,0 to 0,1.5
set nokey
set label "O" at -0.5,-0.2
set label "x" at 7,-0.3 font "Times-Italic,20"
set label "y" at -0.5,1.5 font "Times-Italic,20"
set output "sin.eps"
plot sin(x) ls 2, 0.0000001*x+1 ls 3, 0.0000001*x-1 ls 3

set output "cos.eps"
plot cos(x) ls 2, 0.0000001*x+1 ls 3, 0.0000001*x-1 ls 3

set yrange [-2.5:2.5]
unset arrow
set arrow from 0,0 to 7,0
set arrow from 0,0 to 0,2.5
unset label
set label "O" at -0.5,-0.2
set label "x" at 7,-0.3 font "Times-Italic,20"
set label "y" at -0.6,2.7 font "Times-Italic,20"
set size 0.5,0.35
set output "tan.eps"
plot tan(x) ls 2, "dummy.txt" u 1:2 w l ls 3

unset arrow
set xrange [-2.5:2.5]
set yrange [-1.5:5.5]
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-1" -1, "1" 1, "2" 2, "3" 3, "4" 4, "5" 5)
set arrow from 0,0 to 2.5,0
set arrow from 0,0 to 0,5.5
unset label
set label "O" at -0.3,-0.4
set label "x" at 2.5,-0.3 font "Times-Italic,20"
set label "y" at -0.6,5.7 font "Times-Italic,20"
set size 0.4,0.7
set key bmargin
set output "exp.eps"
plot exp(x) t "y=exp x" ls 2, exp(-x) t "y=exp(-x)" ls 3
EOF


gnuplot <<EOF
set terminal postscript eps enhanced
set size 0.5,0.3
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 2 pt 0
set zeroaxis ls 1
unset arrow
set xrange [-2.5:2.5]
set yrange [-1.5:5.5]
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-1" -1, "1" 1, "2" 2, "3" 3, "4" 4, "5" 5)
set arrow from 0,0 to 2.5,0
set arrow from 0,0 to 0,5.5
unset label
set label "O" at -0.3,-0.4
set label "x" at 2.5,-0.3 font "Times-Italic,20"
set label "y" at -0.6,5.7 font "Times-Italic,20"
set size 0.4,0.7
set key left
set output "y2powx.eps"
plot 2**x t "y=2^x" ls 2, log(2)*2**x t "y=(2^x)'" ls 3
EOF

gnuplot <<EOF
set terminal postscript eps enhanced
set size 0.5,0.3
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 2 pt 0
set zeroaxis ls 1
unset arrow
set xrange [-2.5:2.5]
set yrange [-1.5:5.5]
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-1" -1, "1" 1, "2" 2, "3" 3, "4" 4, "5" 5)
set arrow from 0,0 to 2.5,0
set arrow from 0,0 to 0,5.5
unset label
set label "O" at -0.3,-0.4
set label "x" at 2.5,-0.3 font "Times-Italic,20"
set label "y" at -0.6,5.7 font "Times-Italic,20"
set size 0.4,0.7
set key left
set output "y3powx.eps"
plot 3**x t "y=3^x" ls 2, log(3)*3**x t "y=(3^x)'" ls 3
EOF


gnuplot <<EOF
set output "exp_log.eps"
set terminal postscript eps enhanced 17
set size 0.6
set size ratio 1
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set xrange [-2.8:2.8]; 
set yrange [-2.8:2.5]
set arrow from 0,0 to 2.8 ls 1
set arrow from 0,0 to 0,2.5 ls 1
set nokey
set label "O" at -0.4,-0.35
set label "x" at 2.9,-0.3 font "Times-Italic,20"
set label "y" at -0.5,2.5 font "Times-Italic,20"
set label "exp x" at 1.1,2.6 font "Times,22"
set label "ln x" at 2.5,1.3 font "Times,22"
unset key
plot exp(x) ls 2, log(x) ls 2, x ls 3
EOF


gnuplot <<EOF
set output "Gauss_fnc.eps"
set terminal postscript eps enhanced 16
set size 0.5,0.3
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set xrange [-2.8:2.8]; 
set yrange [-0.5:1.5]
set arrow from 0,0 to 2.8 ls 1
set arrow from 0,0 to 0,1.5 ls 1
set nokey
set label "O" at -0.4,-0.35
set label "x" at 2.9,-0.2 font "Times-Italic,20"
set label "y" at -0.3,1.6 font "Times-Italic,20"
unset key
plot exp(-x*x) ls 2
EOF

gnuplot <<EOF
set output "x_pow_x.eps"
set terminal postscript eps enhanced 18
set size 0.4,0.7
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 2 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("1" 1, "2" 2)
set ytics axis nomirror in ("1" 1, "2" 2, "3" 3, "4" 4)
set xrange [0:2.1]; 
set yrange [-0.5:4.5]
set arrow from -0.1,0 to 2.2,0 ls 1
set arrow from 0,0 to 0,4.6 ls 1
set arrow nohead from exp(-1),0 to exp(-1),exp(-1)**exp(-1) ls 3
set arrow nohead from 0,exp(-1)**exp(-1) to exp(-1),exp(-1)**exp(-1) ls 3
set nokey
set label "O" at -0.2,-0.2
set label "x" at 2.2,-0.2 font "Times-Italic,20"
set label "y" at -0.25,4.5 font "Times-Italic,20"
set label "1/e" at exp(-1)-0.1,-0.3
set label "y=x^x" at 1.5,4
unset key
plot x**x ls 2
EOF


cat <<EOF > dummy.txt
0 1.5
2.8 1.5
EOF
gnuplot <<EOF
set output "logistic_abc.eps"
set terminal postscript eps enhanced 16
set size 0.5,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0
set zeroaxis ls 1
set xrange [-2.8:2.8]; 
set yrange [-0.5:2.0]
unset key
x0=0.8
x1=1.1
y0=tan(x0-0.3)+0.6
y1=tan(x1-0.3)+0.6

set arrow from 0,0 to 0,2
set arrow from 0,0 to 2.8
unset xtics
unset ytics
set label "x" at 2.8,-0.15 font "Times-Italic,24"
set label "y" at -0.4,2.0 font "Times-Italic,24"
set label "1/a" at -0.7,1.5 font "Times,24"
set label "1/(a+b)" at -1.4,0.4 font "Times,24"
set label "O" at -0.4,-0.2 font "Times-Italic,24"
a=2/3.0
b=3
c=3
plot 1/(a+b*exp(-c*x)) ls 2, "dummy.txt" u 1:2 w l
EOF


gnuplot <<EOF
set output "logistic_biol.eps"
set terminal postscript eps enhanced 16
set size 0.5,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0
set zeroaxis ls 1
set xrange [-2.8:2.8]; 
set yrange [-0.5:2.0]
unset key
x0=0.8
x1=1.1
y0=tan(x0-0.3)+0.6
y1=tan(x1-0.3)+0.6

set arrow from 0,0 to 0,2
set arrow from 0,0 to 2.8
unset xtics
unset ytics
set label "t" at 2.8,-0.15 font "Times-Italic,24"
set label "N" at -0.4,2.0 font "Times-Italic,24"
set label "{/Symbol a}/{/Symbol b}" at -0.7,1.5 font "Times-Italic,24"
set label "N_0" at -0.7,0.4 font "Times-Italic,24"
set label "O" at -0.4,-0.2 font "Times-Italic,24"
a=2/3.0
b=3
c=3
plot 1/(a+b*exp(-c*x)) ls 2, "dummy.txt" u 1:2 w l
EOF





# log plot paper

echo a | awk '{for (i=1; i<=1000; i=i*10)    {x=log(i); print x, 0; print x, 10; print "";}}' > dummy_xm.txt
echo a | awk '{for (i=1; i<10; i++)          {x=log(i); print x, 0; print x, 10; print "";}}' > dummy_x.txt
echo a | awk '{for (i=10; i<100; i=i+10)     {x=log(i); print x, 0; print x, 10; print "";}}' >> dummy_x.txt
echo a | awk '{for (i=100; i<=1000; i=i+100) {x=log(i); print x, 0; print x, 10; print "";}}' >> dummy_x.txt
echo a | awk '{for (y=1; y<=9; y++) {print 0, y; print log(1000), y; print "";}}' >> dummy_yn.txt

echo a | awk '{print log(300), 7; print log(40), 4; print log(5), 1}' > dummy_sample.txt
gnuplot <<EOF
set terminal postscript eps enhanced 20
set size 0.6,0.6
#unset border
set style line 1 lt 1 lw 3 pt 0
set style line 2 lt 1 lw 1 pt 0
set style line 3 lt 3 lw 1 pt 7 ps 1.5

set zeroaxis ls 1
set ytics axis nomirror in ("0.1" 0, "1" log(10), "10" log(100), "100" log(1000))
set xtics axis nomirror in ("0" 0, "2" 2, "4" 4, "6" 6, "8" 8, "10" 10)
set yrange [0:6.908]; 
set xrange [0:10]
set xlabel "{/Times-Italic x}";
set ylabel "{/Times-Italic y}"
set y2label "log_{10} {/Times-Italic y}"; set y2range [-1:2]; set y2tics 1; set my2tics 0.1
set nokey
set label "S" at 6.8,5.1
set label "T" at 3.8,2.9
set label "U" at 0.8,1.0

set output "log_paper.eps"
plot "dummy_xm.txt" u 2:1 w l ls 1, "dummy_x.txt" u 2:1 w l ls 2, "dummy_yn.txt" u 2:1 w l ls 2, "dummy_sample.txt" u 2:1 w p ls 3
EOF


# read a graph
cat <<EOF > dummy_sample.txt
24 285
28 260
30 240
31 190
37 170
40 110
EOF
gnuplot <<EOF
set terminal postscript eps enhanced 20
set size 0.5,0.6
set size ratio 1
#unset border
set style line 1 lt 1 lw 3 pt 0
set style line 2 lt 1 lw 1 pt 0
set style line 3 lt 3 lw 1 pt 7 ps 1
a=-10.625
b=545.625
set zeroaxis ls 1
set xtics axis nomirror in ("20" 20, "30" 30, "40" 40)
set ytics axis nomirror in ("100" 100, "200" 200, "300" 300)
set xrange [15:45] 
set yrange [90:320]
set label "x" at 45,80 font "Times-Italic,30"
set label "y" at 12,325 font "Times-Italic,30"
set nokey
set label "A" at 25,295
set label "B" at 31,240
set grid ls 2
set output "read_a_graph.eps"
plot "dummy_sample.txt" u 1:2 w p ls 3
EOF
#plot "dummy_sample.txt" u 1:2 w p ls 3, a*x+b w l



# log-log plot paper

echo a | awk '{print log(300), log(200); print log(20), log(70); print log(2), log(30)}' > dummy_sample.txt
gnuplot <<EOF
set terminal postscript eps enhanced 20
set size 0.5,0.6
set size ratio 1
#unset border
set style line 1 lt 1 lw 3 pt 0
set style line 2 lt 1 lw 1 pt 0
set style line 3 lt 3 lw 1 pt 7 ps 1.5

set zeroaxis ls 1
set xtics axis nomirror in ("0.1" 0, "1" log(10), "10" log(100), "100" log(1000))
set ytics axis nomirror in ("0.1" 0, "1" log(10), "10" log(100), "100" log(1000))
set xrange [0:6.908] 
set yrange [0:6.908]
set nokey
set label "P" at 5.3,4.9
set label "Q" at 2.5,3.8
set label "R" at 0.3,2.9
set output "log_log_paper.eps"
plot "dummy_xm.txt" u 1:2 w l ls 1, "dummy_x.txt" u 1:2 w l ls 2, \
     "dummy_xm.txt" u 2:1 w l ls 1, "dummy_x.txt" u 2:1 w l ls 2, "dummy_sample.txt" u 1:2 w p ls 3
EOF


gnuplot <<EOF
set terminal postscript eps enhanced 16
set output "exp_2exp.eps"
set size 0.5,0.6
unset border
set key bottom right
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 2 pt 0
set style line 3 lt 2 lw 2 pt 0
set style line 4 lt 1 lw 5 pt 0
set style line 5 lt 2 lw 5 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4)
set xrange [-3.2:3.2]
set yrange [-2.9:4.9]
set arrow from 0,0 to 3.2,0
set arrow from 0,0 to 0,4.9
set label "O" at -0.4,-0.35
set label "x" at 3.2,-0.5 font "Times-Italic,20"
set label "y" at -0.6,4.9 font "Times-Italic,20"
set label "e^x" at 1.3,5
set label "e^-^x" at -1.4,5
set label "2^x" at 2.4,5
set label "2^-^x" at -2.6,5
plot 2**x t "(1)" ls 2, 1/2**x t "(2)" ls 3, exp(x) t "(3)" ls 4, exp(-x) t "(4)" ls 5
EOF


gnuplot <<EOF
set terminal postscript eps enhanced 14
set output "log2_ln.eps"
set size 0.4,0.6
unset border
set key bottom right
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 2 lw 2 pt 0
set style line 4 lt 3 lw 4 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-1" -1, "1" 1, "2" 2, "3" 3)
set ytics axis nomirror in ("-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2)
set xrange [-1.5:3.7]
set yrange [-3.9:2.2]
set arrow from 0,0 to 3.7,0
set arrow from 0,0 to 0,2.2
set label "O" at -0.4,-0.35
set label "x" at 3.2,-0.5 font "Times-Italic,20"
set label "y" at -0.6,2.2 font "Times-Italic,20"

plot log (x)/log (2) t "(1) log_2 x   " ls 2, log (x) t "(2) ln x       " ls 3, log (1+x) t "(3) ln (1+x)" ls 4
EOF



# Pitagorus
echo "0 0" > dummy.txt
gnuplot <<EOF
set output "Pitag.eps"
set terminal postscript eps enhanced 28
set size 0.5,0.42
set size ratio 0.5
unset border
set style line 1 lt 1 lw 2 pt 0

#set zeroaxis ls 1
unset zeroaxis
set xrange [0:1.2] 
set yrange [0:0.6]
set nokey
unset xtics
unset ytics
set arrow nohead from 0,0 to 1,0
set arrow nohead from 0,0 to 1,0.5774
set arrow nohead from 1,0.5774 to 1.0,0.0
set arrow nohead from 0.75,0.433 to 1.0,0.0 lt 2 lw 2
set arrow nohead from 0.9,0.1 to 1.0,0.1
set arrow nohead from 0.9,0.1 to 0.9,0.0
set arrow nohead from 0.8,0.346 to 0.887,0.396
set arrow nohead from 0.837,0.483 to 0.887,0.396
set label "A" at -0.1,-0.05
set label "D" at 0.68,0.5
set label "B" at 0.97,0.64
set label "C" at 0.98,-0.07
plot "dummy.txt" u 1:2 ls 1
EOF



#
echo a | awk '{for (t=0; t<0.5; t=t+0.02) print 0.15*cos(t), 0.15*sin(t)}' > dummy.txt
gnuplot <<EOF
set output "triangle_rect.eps"
set terminal postscript eps enhanced 25
set size 0.5,0.35
set size ratio 0.5
unset border
set style line 1 lt 1 lw 2 pt 0

#set zeroaxis ls 1
unset zeroaxis
set xrange [0:1.2] 
set yrange [0:0.65]
set nokey
unset xtics
unset ytics
set arrow nohead from 0,0 to 1.0,0
set arrow nohead from 0,0 to 1.0,0.6
set arrow nohead from 1.0,0 to 1.0,0.6
set arrow nohead from 0.9,0 to 0.9,0.1
set arrow nohead from 1.0,0.1 to 0.9,0.1
set label "O" at -0.1,-0.06
set label "A" at 1.03,0.63
set label "B" at 1.03,-0.08
set label "{/Symbol q}" at 0.2,0.06
plot "dummy.txt" u 1:2 ls 1
EOF
rm dummy.txt



# 
echo a | awk '{for (t=0; t<0.64; t=t+0.02) print 0.15*cos(t), 0.15*sin(t)}' > dummy.txt
gnuplot <<EOF
set output "triangle_sincos.eps"
set terminal postscript eps enhanced 25
set size 0.5,0.4
set size ratio 0.5
unset border
set style line 1 lt 1 lw 2 pt 0

#set zeroaxis ls 1
unset zeroaxis
set xrange [0:1.2] 
set yrange [0:0.65]
set nokey
unset xtics
unset ytics
set arrow nohead from 0,0 to 0.91
set arrow nohead from 0,0 to 0.7,0.55
set arrow nohead from 0.91,0 to 0.7,0.55
set arrow nohead from 0.7,0.55 to 0.7,0.0 lt 2 lw 2
set arrow nohead from 0.6,0.1 to 0.7,0.1
set arrow nohead from 0.6,0.1 to 0.6,0.0
set label "C" at -0.1,-0.06
set label "B" at 0.7,0.63
set label "A" at 0.97,-0.08
set label "P" at 0.68,-0.08
#set label "{/Symbol q}" at 0.18,0.07
plot "dummy.txt" u 1:2 ls 1
EOF
rm dummy.txt


# 1rad
echo a | awk '{for (t=0; t<=1.005; t=t+0.002) print cos(t), sin(t)}' > dummy.txt
gnuplot <<EOF
set output "1rad.eps"
set terminal postscript eps enhanced 24
set size 0.5,0.5
set size ratio 1
unset border
set style line 1 lt 1 lw 2 pt 0

#set zeroaxis ls 1
unset zeroaxis
set xrange [0:1.02] 
set yrange [0:1.02]
set nokey
unset xtics
unset ytics
set arrow nohead from 0,0 to 1,0
set arrow nohead from 0,0 to 0.5,0.8660254
set arrow nohead from 1,0 to 0.5,0.8660254
set arrow nohead from 0,0 to 0.540302,0.8414709
set label "A" at -0.08,-0.03
set label "B" at 1.01,-0.03
set label "C" at 0.42,0.93
set label "C'" at 0.54,0.91
plot "dummy.txt" u 1:2 w l ls 1
EOF




# sin x \approx x
echo a | awk '{for (t=0; t<3.14/6; t=t+0.02) print cos(t), sin(t)}' > dummy.txt
echo a | awk '{for (t=0; t<3.14/6; t=t+0.02) print 0.19*cos(t), 0.19*sin(t)}' > dummy2.txt
gnuplot <<EOF
set output "sinx_x.eps"
set terminal postscript eps enhanced 28
set size 0.5,0.42
set size ratio 0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 3 lt 1 lw 1 pt 0

#set zeroaxis ls 1
unset zeroaxis
set xrange [0:1.2] 
set yrange [0:0.6]
set nokey
unset xtics
unset ytics
set arrow nohead from 0,0 to 1,0
set arrow nohead from 0,0 to 0.866,0.5
set arrow nohead from 0,0 to 1,0.5774 lt 2 lw 2
set arrow nohead from 0.866,0.5 to 0.866,0.0 lt 2 lw 2
set arrow nohead from 1,0.5774 to 1.0,0.0 lt 2 lw 2
set label "O" at -0.1,-0.04
set label "P" at 0.82,0.57
set label "Q" at 0.97,0.65
set label "R" at 0.81,-0.1
set label "S" at 0.98,-0.1
set label "{/Symbol q}" at 0.26,0.08
plot "dummy.txt" u 1:2 w l ls 1, sqrt(1-x*x) w l lt 2 lw 2, "dummy2.txt" u 1:2 w l ls 3
EOF
rm dummy.txt dummy2.txt


gnuplot <<EOF
set output "sin_square.eps"
set terminal postscript eps enhanced
set size 0.5,0.2
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 2 pt 0
set style line 3 lt 3 lw 1 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2{/Symbol p}" -6.28, "-{/Symbol p}" -3.14, "{/Symbol p}" 3.14, "2{/Symbol p}" 6.28)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set xrange [-7:7]; 
set yrange [-0.5:1.5]
set arrow from 0,0 to 7,0
set arrow from 0,0 to 0,1.5
set nokey
set label "O" at -0.6,-0.3
set label "x" at 7,-0.3 font "Times-Italic,20"
set label "y" at -0.5,1.5 font "Times-Italic,20"
unset key
plot (sin(x))*(sin(x)) w l ls 1, x*0.000001+1 w l ls 3
EOF

gnuplot <<EOF
set output "sin_abs.eps"
set terminal postscript eps enhanced
set size 0.5,0.2
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 2 pt 0
set style line 3 lt 3 lw 1 pt 0
set sample 500
set zeroaxis ls 1
set xtics axis nomirror in ("-2{/Symbol p}" -6.28, "-{/Symbol p}" -3.14, "{/Symbol p}" 3.14, "2{/Symbol p}" 6.28)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set xrange [-7:7]; 
set yrange [-0.5:1.5]
set arrow from 0,0 to 7,0
set arrow from 0,0 to 0,1.5
set nokey
set label "O" at -0.5,-0.2
set label "x" at 7,-0.3 font "Times-Italic,20"
set label "y" at -0.5,1.5 font "Times-Italic,20"
unset key
plot abs(sin(x)) w l ls 1, x*0.000001+1 w l ls 3
EOF

echo "0 5" > dummy.txt
gnuplot <<EOF
set output "throw_fall.eps"
set terminal postscript eps enhanced 20
set size 0.5,0.6
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 2 pt 7 ps 2
set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4, "5" 5, "6" 6, "7" 7, "8" 8)
set xrange [-1.3:3.3]; 
set yrange [-0.5:7.7]
set arrow from 0,0 to 3.3
set arrow from 0,0 to 0,7.7
set arrow from 0.0,5.0 to 0.4,6.5
set nokey
set label "t=0" at 0.1,4.5
set label "O" at -0.3,-0.5
set label "x" at 3.2,-0.3 font "Times-Italic,20"
set label "y" at -0.5,7.6 font "Times-Italic,20"
unset key
plot 5+4*x-2*x*x w l 1, "dummy.txt" u 1:2 w p ls 2 
EOF


# computer
gnuplot <<EOF
set output "cmp_circle.eps"
set terminal postscript eps enhanced 18
set size ratio 1 0.6,0.8
set grid
unset border
unset key
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 2 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-1.5" -1.5, "-1" -1, "-0.5" -0.5, "0.5" 0.5, "1" 1, "1.5" 1.5)
set ytics axis nomirror in ("-1.5" -1.5, "-1" -1, "-0.5" -0.5, "0.5" 0.5, "1" 1, "1.5" 1.5)
set xrange [-1.5:1.5]
set yrange [-1.5:1.5]
set arrow from 0,0 to 1.6,0
set arrow from 0,0 to 0,1.6
set label "O" at -0.15,-0.15
set label "x" at 1.71,-0.1 font "Times-Italic,20"
set label "y" at -0.4,1.6 font "Times-Italic,20"
unset key
set parametric
set sample 200
plot cos(t),sin(t) w l ls 2

set output "cmp_ellipse1.eps"
plot cos(t),sin(t+pi/3) w l ls 2

set output "cmp_Lissajous.eps"
plot cos(3*t),sin(4*t) w l ls 2

set output "cmp_Hitode.eps"
plot (cos(5*t)/2+1)*cos(t),(cos(5*t)/2+1)*sin(t) w l ls 2
EOF




gnuplot <<EOF
set output "det2D.eps"
set terminal postscript eps enhanced 22
set size 0.4,0.6
unset border
set style line 1 lt 1 lw 2 pt 0

set zeroaxis ls 1
unset xtics
unset ytics
set xrange [-1:5]
set yrange [-1:5]
set arrow from 0,0 to 5,0
set arrow from 0,0 to 0,5
set label "O" at -0.6,-0.26
set label "x" at 4.7,-0.3 font "Times-Italic,24
set label "y" at -0.5,4.7 font "Times-Italic,24
set label "A" at 3.2,1
set label "B" at 0.5,3.0
set label "C" at 4.2,4.1
set label "D" at 3.8,3.0
set label "E" at 2.5,-0.4
unset key
set arrow from 0,0 to 3,1 lt 1 lw 3
set arrow from 0,0 to 1,3 lt 1 lw 3
set arrow nohead from 1,3 to 4,4
set arrow nohead from 3,1 to 4,4
set arrow nohead from 1,3 to 3.65,3 lt 2 lw 2
set arrow nohead from 3,1 to 2.673,0 lt 2 lw 2
plot 0.000001*x
EOF


gnuplot <<EOF
set output "det2D2.eps"
set terminal postscript eps enhanced 22
set size 0.4,0.65
unset border
set style line 1 lt 1 lw 2 pt 0

set zeroaxis ls 1
unset xtics
unset ytics
set xrange [-0.5:5]
set yrange [-0.5:5]
set arrow from 0,0 to 5,0
set arrow from 0,0 to 0,5
set label "O" at -0.6,-0.26
set label "x" at 4.7,-0.3 font "Times-Italic,24
set label "y" at -0.5,4.7 font "Times-Italic,24
set label "A" at 2.5,1.3
set label "B" at 1.1,2.6
set label "C" at 4.2,4.1

set label "P" at 2.8,-0.3
set label "Q" at 4.1,1.0
set label "R" at -0.5,3.0
set label "S" at 0.8,4.2
set label "U" at 3.8,-0.3
set label "V" at -0.5,4.0

unset key
set arrow from 0,0 to 3,1 lt 1 lw 3
set arrow from 0,0 to 1,3 lt 1 lw 3
set arrow nohead from 1,3 to 4,4
set arrow nohead from 3,1 to 4,4
set arrow nohead from 1,3 to 1,4 lt 2 lw 2
set arrow nohead from 1,3 to 0,3 lt 2 lw 2
set arrow nohead from 3,1 to 4,1 lt 2 lw 2
set arrow nohead from 3,1 to 3,0 lt 2 lw 2
set arrow nohead from 0,4 to 4,4 lt 2 lw 2
set arrow nohead from 4,0 to 4,4 lt 2 lw 2
plot 0.000001*x
EOF


cat <<EOF > dummy1
2 1.5
EOF
gnuplot <<EOF
set output "cplane.eps"
set terminal postscript eps enhanced 32
set size 0.8,1.0
unset border
set style line 1 lt 1 lw 3 pt 0
set style line 2 lt 2 lw 2 pt 0
set pointsize 2.0
set zeroaxis ls 1
unset xtics
unset ytics
#set xtics axis nomirror in ("x" 2)
#set ytics axis nomirror in ("y" 1.5)
set xrange [-3:3]
set yrange [-3:3]
set arrow from 0,0 to 3.0,0 ls 1
set arrow from 0,0 to 0,3.0 ls 1
set arrow nohead from 2,0 to 2,1.5 ls 2
set arrow nohead from 0,1.5 to 2,1.5 ls 2
set label "O" at -0.4,-0.4
set label "Re" at 3.0,-0.4
set label "Im" at -0.7,3.0
unset key
set label "z=x+yi"   at 1.8,1.9 font "Century-Italic,32"
set label "x"   at 1.95,-0.3 font "Century-Italic,32"
set label "y"   at -0.4,1.5 font "Century-Italic,32"
plot "dummy1" w p 7
EOF


cat <<EOF > dummy1
1 2
-1 -2
2 2
1 1
-2 1
-3 4
0.2 -0.4
EOF
gnuplot <<EOF
set output "cplane1.eps"
set terminal postscript eps enhanced 25
set size 0.8,1.0
unset border
set style line 1 lt 1 lw 3 pt 0
set style line 2 lt 2 lw 2 pt 0
set pointsize 2.0
set zeroaxis ls 1
set xtics axis nomirror in ("-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3)
set ytics axis nomirror in ("-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4)
set xrange [-3.5:3.2]
set yrange [-3.2:4.5]
set grid lt 2
set arrow from -3.5,0 to 3.2,0 ls 1
set arrow from 0,-3.2 to 0,4.5 ls 1
set label "O" at -0.4,-0.4
set label "Re" at 3.2,-0.4
set label "Im" at -0.6,4.5
unset key
set label "z"   at 1.2,1.8 font "Century-Italic,30"
set label "{/Symbol -}z"  at -1.6,-2.2 font "Century-Italic,30"
set label "1+z" at 2.2,1.8 font "Century-Italic,30"
set label "z{/Symbol -}i" at 1.2,0.8 font "Century-Italic,30"
set label "iz"  at -1.8,0.8 font "Century-Italic,30"
set label "z^2" at -2.8,3.6 font "Century-Italic,30"
set label "1/z" at 0.25,-0.7 font "Century-Italic,30"
plot "dummy1" w p 7
EOF


# vector field

echo a | awk '{a=2;b=1;c=2;d=3;for(x=-3;x<=3;x=x+0.5)for(y=-3;y<=3;y=y+0.5)print x, y, 0.1*x,0.1*y}' > orig
echo a | awk '{a=2;b=1;c=2;d=3;for(x=-3;x<=3;x=x+0.5)for(y=-3;y<=3;y=y+0.5)print x, y, 0.1*(a*x+b*y),0.1*(c*x+d*y)}' > conv
gnuplot <<EOF
set output "eigen.eps"
set terminal postscript eps enhanced 16
set size ratio 1 0.5,0.7
unset border
set style line 1 lt 1 lw 1 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 2 lw 1 pt 0
set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set xrange [-2.8:2.8]; 
set yrange [-2.8:2.8]
set arrow from 0,0 to 2.8 ls 1
set arrow from 0,0 to 0,2.8 ls 1
set nokey
set label "O" at -0.3,-0.25
set label "x" at 2.9,-0.2 font "Times-Italic,20"
set label "y" at -0.3,2.9 font "Times-Italic,20"
unset key
plot "orig" with vector ls 2, "conv" with vector ls 3
EOF

echo a | awk '{a=2;b=1;c=2;d=3;for(x=-3;x<=3;x=x+0.5)for(y=-3;y<=3;y=y+0.5)print x, y, 0.1*x,0.1*y}' > orig
echo a | awk '{a=0.5;b=-1.73/2;c=1.73/2;d=0.5;for(x=-3;x<=3;x=x+0.5)for(y=-3;y<=3;y=y+0.5)print x, y, 0.1*(a*x+b*y),0.1*(c*x+d*y)}' > conv
gnuplot <<EOF
set output "rot_vectf.eps"
set terminal postscript eps enhanced 16
set size ratio 1 0.5,0.7
unset border
set style line 1 lt 1 lw 1 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 2 lw 1 pt 0
set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set xrange [-2.8:2.8]; 
set yrange [-2.8:2.8]
set arrow from 0,0 to 2.8 ls 1
set arrow from 0,0 to 0,2.8 ls 1
set nokey
set label "O" at -0.3,-0.25
set label "x" at 2.9,-0.2 font "Times-Italic,20"
set label "y" at -0.3,2.9 font "Times-Italic,20"
unset key
plot "orig" with vector ls 2, "conv" with vector ls 3
EOF

# Taylor of sin
gnuplot <<EOF
set terminal postscript eps enhanced 20
set output "Taylor_sin.eps"
set size 0.7,1.95
unset border
set multiplot
unset key
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 4 pt 0
set style line 3 lt 2 lw 2 pt 0
set style line 4 lt 3 lw 1 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-3{/Symbol p}/2" -3.1415*1.5, "-{/Symbol p}" -3.1415, "-{/Symbol p}/2" -3.1415/2, "{/Symbol p}/2" 3.1415/2, "{/Symbol p}" 3.1415, "3{/Symbol p}/2" 3.1415*1.5)
set ytics axis nomirror in ("-1" -1, "1" 1)
set xrange [-5.0:5.0];
set yrange [-1.6:1.6]
set arrow from 0,0 to 5,0
set arrow from 0,0 to 0.0,2.0
set label "O" at -0.3,-0.2
set label "x" at 5.1,-0.3 font "Times-Italic,20"
set label "y" at -0.5,1.7 font "Times-Italic,20"

set origin 0.0,1.5; set size 0.7,0.45
set title offset 9,0 "y=x "
plot sin(x) ls 3, x ls 2

set origin 0.0,1.0; set size 0.7,0.45
set title "y= x-x^3/3!"
plot sin(x) ls 3, x-(x**3)/6 ls 2

set origin 0.0,0.5; set size 0.7,0.45
set title "y= x-x^3/3!+x^5/5!"
plot sin(x) ls 3, x-(x**3)/6+(x**5)/120 ls 2

set origin 0.0,0.0; set size 0.7,0.45
set title "y= x-x^3/3!+x^5/5!-x^7/7!"
plot sin(x) ls 3, x-(x**3)/6+(x**5)/120-(x**7)/(120*6*7) ls 2
EOF



gnuplot <<EOF
set output "normal_dist.eps"
set terminal postscript eps enhanced 18
set size 0.5,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("-2" -2, "-1" -1, "1" 1, "2" 2)
set ytics axis nomirror in ("0.2" 0.2, "0.4" 0.4)
set xrange [-3.5:3.5]; 
set yrange [-0.1:0.5]
set arrow from 0,0 to 3.5 ls 1
set arrow from 0,0 to 0,0.5 ls 1
set nokey
set label "O" at -0.3,-0.08
set label "z" at 3.3,-0.1 font "Times-Italic,20"
set label "f(z)" at -0.8,0.5 font "Times-Italic,20"
unset key
pi=3.14159
plot (exp(-x*x/2))/sqrt(2*pi) ls 2
EOF

gnuplot <<EOF
set output "normal_dist0.eps"
set terminal postscript eps enhanced 16
set size 0.5,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 1 pt 0

set zeroaxis ls 1
set xtics axis nomirror in ("{/Symbol m}-{/Symbol s}" 3, "{/Symbol m}" 4, "{/Symbol m}+{/Symbol s}" 5)
set ytics axis nomirror in ("0.2" 5)
set xrange [-1.0:8.0]; 
set yrange [-0.2:0.5]
set arrow from 0,0 to 8.0,0 ls 1
set arrow from 0,0 to 0,0.5 ls 1
set arrow nohead from 4,0 to 4,0.4 ls 3
set arrow nohead from 3,0 to 3,0.25 ls 3
set arrow nohead from 5,0 to 5,0.25 ls 3
set nokey
set label "O" at -0.5,-0.06
set label "x" at 8.0,-0.1 font "Times-Italic,20"
set label "f(x)" at -1.2,0.5 font "Times-Italic,20"
unset key
pi=3.14159
m=4
plot (exp(-(x-m)*(x-m)/2))/sqrt(2*pi) ls 2
EOF


gnuplot <<EOF
set output "normal_dist3.eps"
set terminal postscript eps enhanced 16
set size 0.6,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 2 pt 0
set style line 4 lt 2 lw 4 pt 0


set zeroaxis ls 1
set xtics axis nomirror in ("-4" 4, "-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4)
set ytics axis nomirror in ("0.2" 0.2, "0.4" 0.4)
set xrange [-4.5:4.5]; 
set yrange [-0.1:0.5]
set arrow from 0,0 to 4.5 ls 1
set arrow from 0,0 to 0,0.5 ls 1
set key left top
set label "O" at -0.4,-0.05
set label "x" at 4.4,-0.05 font "Times-Italic,20"
set label "f(x)" at -0.9,0.5 font "Times-Italic,20"
pi=3.14159
s1=1.0; m1=0.0
s2=2.0; m2=0.0
s3=1.0; m3=1.0
plot (exp(-(x-m1)*(x-m1)/(2*s1*s1)))/sqrt(2*pi*s1*s1) t "{/Symbol m}=0, {/Symbol s}=1" ls 2, \\
     (exp(-(x-m2)*(x-m2)/(2*s2*s2)))/sqrt(2*pi*s2*s2) t "{/Symbol m}=0, {/Symbol s}=2" ls 3, \\
     (exp(-(x-m3)*(x-m3)/(2*s3*s3)))/sqrt(2*pi*s3*s3) t "{/Symbol m}=1, {/Symbol s}=1" ls 4
EOF


gnuplot <<EOF
set output "probdensity.eps"
set terminal postscript eps enhanced 20
set size 0.6,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 2 pt 0
set style line 4 lt 2 lw 4 pt 0

set zeroaxis ls 1
#set xtics axis nomirror in ("-4" 4, "-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4)
set ytics axis nomirror in ("0" 0.0)
set xtics axis nomirror in ("a" 2, "b" 3)
set xrange [-0.5:5.5]; 
set yrange [-0.1:0.6]
set arrow from 0,0 to 5.5,0 ls 1
set arrow from 0,0 to 0,0.6 ls 1
set nokey
#set label "O" at -0.4,-0.05
set label "x" at 5.4,-0.05 font "Times-Italic,20"
set label "f(x)" at 0.2,0.55 font "Times-Italic,20"
pi=3.14159
s1=0.3; m1=1.3
s2=0.8; m2=2.7
s3=1.0; m3=1.0
f(x)=0.1*(exp(-(x-m1)*(x-m1)/(2*s1*s1)))/sqrt(2*pi*s1*s1)+0.9*(exp(-(x-m2)*(x-m2)/(2*s2*s2)))/sqrt(2*pi*s2*s2)
plot [0:5.5][0:0.6]f(x) ls 1
EOF


gnuplot <<EOF
set output "probdensity_a_b.eps"
set terminal postscript eps enhanced 20
set size 0.6,0.5
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 2 pt 0
set style line 4 lt 2 lw 4 pt 0

set zeroaxis ls 1
#set xtics axis nomirror in ("-4" 4, "-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4)
set ytics axis nomirror in ("0" 0.0)
set xtics axis nomirror in ("a" 2, "b" 3)
set xrange [-0.5:5.5]; 
set yrange [-0.1:0.6]
set arrow from 0,0 to 5.5,0 ls 1
set arrow from 0,0 to 0,0.6 ls 1
set nokey
#set label "O" at -0.4,-0.05
set label "x" at 5.4,-0.05 font "Times-Italic,20"
set label "f(x)" at 0.2,0.55 font "Times-Italic,20"
pi=3.14159
s1=0.3; m1=1.3
s2=0.8; m2=2.7
s3=1.0; m3=1.0
f(x)=0.1*(exp(-(x-m1)*(x-m1)/(2*s1*s1)))/sqrt(2*pi*s1*s1)+0.9*(exp(-(x-m2)*(x-m2)/(2*s2*s2)))/sqrt(2*pi*s2*s2)
plot [0:5.5][0:0.6]f(x) ls 1, (2<x && x<3 ? f(x): 1/0) with filledcurve x1 notitle 
EOF

gnuplot <<EOF
set output "probdist.eps"
set terminal postscript eps enhanced 20
set size 0.6,0.8
unset border
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 3 pt 0
set style line 3 lt 3 lw 2 pt 0
set style line 4 lt 2 lw 4 pt 0

set zeroaxis ls 1
#set xtics axis nomirror in ("-4" 4, "-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3, "4" 4)
set ytics axis nomirror in ("0" 0.0, "1" 1.0)
set xtics axis nomirror in ("a" 2, "b" 3)
set xrange [-0.5:5.5]; 
set yrange [-0.1:1.1]
set arrow from 0,0 to 5.5,0 ls 1
set arrow from 0,0 to 0,1.1 ls 1
set nokey
#set label "O" at -0.4,-0.05
set label "x" at 5.4,-0.05 font "Times-Italic,20"
set label "f(x), F(x)" at 0.2,1.1 font "Times-Italic,20"
pi=3.14159
s1=0.3; m1=1.3
s2=0.8; m2=2.7
s3=1.0; m3=1.0
f(x)=0.1*(exp(-(x-m1)*(x-m1)/(2*s1*s1)))/sqrt(2*pi*s1*s1)+0.9*(exp(-(x-m2)*(x-m2)/(2*s2*s2)))/sqrt(2*pi*s2*s2)
x0=0   # 積分区間の下限
x1=5   # 積分区間の上限
N=100   # 積分区間の分割数
#set xrange [x0:x1]
set samples N+1
plot [0:5.5][0:1.1] lastx=0.0,lasty=0.0,integ = 0.0,\
     "+" using 1:(f(\$1)) w l lw 3 title "gauss function exp(-x^2)", \
     "+" using 1:(dx=\$1-lastx, \
     integ = (\$0==0 ? 0.0 : integ+dx*(f(\$1)+lasty)*0.5), \
     lastx=\$1, \
     lasty=f(\$1), \
     integ) w l lw 3 title "integral", \
     0.000001*x+1.0 w l
EOF




gnuplot <<EOF
set terminal postscript eps enhanced 20
set output "normal_integ.eps"
set size 1.05,1.5
unset border
set multiplot
unset key
set style line 1 lt 1 lw 2 pt 0
set style line 2 lt 1 lw 4 pt 0
set style line 3 lt 2 lw 2 pt 0
set style line 4 lt 3 lw 1 pt 0

set zeroaxis ls 1
#set xtics axis nomirror in ("-3" -3, "-2" -2, "-1" -1, "1" 1, "2" 2, "3" 3)
set ytics axis nomirror in ("0.4" 0.4)
set xrange [-3.4:3.4]; 
set yrange [-0.1:0.48]
set arrow from 0,0 to 3.4
set arrow from 0,0 to 0,0.48
set label "O" at -0.4,-0.05
set label "z" at 3.4,-0.05 font "Times-Italic,20"
set label "f(z)" at 0.2,0.45 font "Times-Italic,20"
s1=1.0; m1=0.0
f(x)=(exp(-(x-m1)*(x-m1)/(2*s1*s1)))/sqrt(2*pi*s1*s1)

set xtics axis nomirror in ("-1" -1, "1" 1)
set origin 0.0,1.0; set size 0.35,0.45
set title offset -2.0 "P(-1<Z<1)=0.68"
plot [-3.4:3.4][0:0.48]f(x) ls 1, (-1<x && x<1 ? f(x): 1/0) with filledcurve x1 notitle 

set origin 0.0,0.5; set size 0.35,0.45
set title offset -2.0 "P(1<|Z|)=0.32"
plot [-3.4:3.4][0:0.48]f(x) ls 1, (x<-1 || 1<x ? f(x): 1/0) with filledcurve x1 notitle 

set origin 0.0,0.0; set size 0.35,0.45
set title offset -2.0 "P(1<Z)=0.16"
plot [-3.4:3.4][0:0.48]f(x) ls 1, (1<x ? f(x): 1/0) with filledcurve x1 notitle 


set xtics axis nomirror in ("-1.64" -1.64, "1.64" 1.64)
set origin 0.35,1.0; set size 0.35,0.45
set title offset -2.0 "P(-1.64<Z<1.64)=0.90"
plot [-3.4:3.4][0:0.48]f(x) ls 1, (-1.64<x && x<1.64 ? f(x): 1/0) with filledcurve x1 notitle 

set origin 0.35,0.5; set size 0.35,0.45
set title offset -2.0 "P(1.64<|Z|)=0.10"
plot [-3.4:3.4][0:0.48]f(x) ls 1, (x<-1.64 || 1.64<x ? f(x): 1/0) with filledcurve x1 notitle 

set origin 0.35,0.0; set size 0.35,0.45
set title offset -2.0 "P(1.64<Z)=0.05"
plot [-3.4:3.4][0:0.48]f(x) ls 1, (1.64<x ? f(x): 1/0) with filledcurve x1 notitle 


set xtics axis nomirror in ("-1.96" -1.96, "1.96" 1.96)
set origin 0.70,1.0; set size 0.35,0.45
set title offset -2.0 "P(-1.96<Z<1.96)=0.95"
plot [-3.4:3.4][0:0.48]f(x) ls 1, (-1.96<x && x<1.96 ? f(x): 1/0) with filledcurve x1 notitle 

set origin 0.70,0.5; set size 0.35,0.45
set title offset -2.0 "P(1.96<|Z|)=0.05"
plot [-3.4:3.4][0:0.48]f(x) ls 1, (x<-1.96 || 1.96<x ? f(x): 1/0) with filledcurve x1 notitle 

set origin 0.70,0.0; set size 0.35,0.45
set title offset -2.0 "P(1.96<Z)=0.025"
plot [-3.4:3.4][0:0.48]f(x) ls 1, (1.96<x ? f(x): 1/0) with filledcurve x1 notitle 
EOF

