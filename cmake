#!/bin/bash
# Script follows here:
echo '1'
xelatex cmain.tex > /dev/null
zhmakeindex -q -s main.mst cmain
for ((n=2;n<4;n++))
do
	echo $n
	xelatex cmain.tex > /dev/null
done
rm *.ilg *.out