#!/bin/sh

set -e

#rm -f notes.aux
makeindex notes
xelatex -synctex=1 -interaction errorstopmode notes
