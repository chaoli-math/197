#!/bin/bash
# Author : buwailee
# Script follows here:
xelatex --synctex=1 main > /dev/null
echo "1. O.K."
zhmakeindex -q main.idx
xelatex --synctex=1 main > /dev/null
echo "2. O.K."
rm *.ilg *.out
