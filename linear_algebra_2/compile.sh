#!/bin/sh

set -e

#rm -f notes.aux
makeindex notes
xelatex -interaction errorstopmode notes
