#!/bin/sh

pandoc README.md -f markdown -t html -c org.css --columns=1000 -o body.html

cat head.html > index.html
cat body.html >> index.html
cat tail.html >> index.html
