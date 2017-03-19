#!/bin/bash
# Author : buwailee
# Script follows here:
echo '1'
xelatex cmain.tex > /dev/null
zhmakeindex -q cmain
for ((n=2;n<10;n++))
do
	echo $n
	xelatex cmain.tex > /dev/null
done