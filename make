#!/bin/bash
# Script follows here:
aplatex -synctex=1 main > /dev/null
echo "1. O.K."
zhmakeindex -q main.idx
aplatex -synctex=1 main > /dev/null
echo "2. O.K."
rm *.ilg *.out
