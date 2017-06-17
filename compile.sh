#!/bin/sh

platex main.tex
platex main.tex
platex main.tex
# http://www.interq.or.jp/mars/cherry/tex/mendex.html

makeindex main.idx
mendex -s gind.ist main.idx
platex main.tex
#dvipdfmx main.dvi
rm *.aux
mv main.dvi math.dvi
mv main.pdf 2016_remedial_math.pdf

