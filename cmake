#!/bin/bash
# Script follows here:
xelatex cmain.tex > /dev/null
echo '1'
zhmakeindex -q -s main.mst cmain
for ((n=2;n<4;n++)) do
	xelatex cmain.tex > /dev/null
	echo $n
done
rm *.ilg *.out
