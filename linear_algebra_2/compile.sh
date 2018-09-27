#!/bin/sh

set -e

makeindex notes
xelatex -interaction errorstopmode notes
