#!/bin/sh

for f in "index" "education" "work-history"
do
  # --columns=1000 is a tricky to force pandoc not setting styles for table cells.
  pandoc ${f}.md -f markdown -t html --columns=1000 -o ${f}.tmp
  sed 's/md/html/g' ${f}.tmp > ${f}.body
  cat head.html > ${f}.html
  cat ${f}.body >> ${f}.html
  cat tail.html >> ${f}.html
  
  # clean
  rm ${f}.tmp ${f}.body
done

# udpate readme
cp index.md README.md
