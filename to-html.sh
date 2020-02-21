#!/bin/sh

HEAD=head.html
TAIL=tail.html

cp README.md index.md

for f in "index" "education" "work-history"
do
  pandoc ${f}.md -f markdown -t html --columns=1000 -o ${f}.tmp
  sed 's/md/html/g' ${f}.tmp > ${f}.body
  cat head.html > ${f}.html
  cat ${f}.body >> ${f}.html
  cat tail.html >> ${f}.html
  
  # clean
  rm ${f}.tmp ${f}.body
done

rm index.md
