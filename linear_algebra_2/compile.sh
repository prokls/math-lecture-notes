#!/bin/sh

set -e

#rm -f notes.aux
if [ -f "notes.idx" ] ; then
  makeindex notes
fi
xelatex -synctex=1 -interaction nonstopmode notes
xelatex -synctex=1 -interaction nonstopmode questions
