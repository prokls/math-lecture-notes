#!/bin/bash

set -e

if [ -f "index.idx" ]; then
  makeindex index
fi
xelatex -halt-on-error -interaction errorstopmode index
exit "$?"
