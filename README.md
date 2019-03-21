# math_remedial
本教材はその後, 何回か改訂され, 「ライブ講義　大学１年生のための数学入門」（講談社; 2019）として出版されましたので, GitHubでの今後の改訂は停止します。

--------------------------------------------
2012/12/28 Kenlo Nishida Nasahara nasahara.kenlo.gw@u.tsukuba.ac.jp

.tex files ... Main body of the text. Written in TeX.  
.odg files ... Figures and graphs. Created with OpenOffice.org/Draw software.  
.ods file  ... Spread sheet for computaer section. Created with OpenOffice.org/Calc software.  
figure.sh  ... Shell-script for creating graphs & figures by Gnuplot.  
compile.sh ... Shell-script for compiling TeX files and creating dvi file.  

I create these files on Ubuntu Linux.

To compile, first, install TeX and emath library.  
Then run the following command on Linux.  
$ sh figure.sh  
$ sh compile.sh  
Then you get "main.dvi". Then convert it by using dvipdfmx.  

