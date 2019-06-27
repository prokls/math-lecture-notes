#!/bin/bash

set -e

if [ -f "notes.idx" ]; then
  makeindex notes
fi
xelatex -halt-on-error --synctex=1 -interaction errorstopmode theorems_and_definitions
xelatex -halt-on-error --synctex=1 -interaction errorstopmode theorems_and_definitions_2
xelatex -halt-on-error --synctex=1 -interaction errorstopmode notes
exit "$?"
