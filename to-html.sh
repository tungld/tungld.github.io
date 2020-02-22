#!/bin/sh

updated_date=`date +"%d %B, %Y"`

tail="<hr />"
tail="${tail}\n<p>This page was generated by <a href="https://pandoc.org">Pandoc</a> from <a href="https://daringfireball.net/projects/markdown/syntax">Markdown</a>. Its source code is available <a href="https://github.com/tungld/tungld.github.io">here</a>. Latest update on ${updated_date}."
tail="${tail}\n</p>"
tail="${tail}\n</body>"
tail="${tail}\n</html>"

for f in "index" "education" "work-history"
do
  # --columns=1000 is a tricky to force pandoc not setting styles for table cells.
  pandoc ${f}.md -f markdown -t html --columns=1000 -o ${f}.body
  # change hyperlinks from .md to .html
  sed -i -e 's/md/html/g' ${f}.body

  cat head.html > ${f}.html
  cat ${f}.body >> ${f}.html
  echo ${tail} >> ${f}.html

  # clean up
  rm ${f}.body

done

# udpate readme
cp index.md README.md
