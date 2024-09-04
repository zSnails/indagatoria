SOURCE=$(shell ls src/* 2> /dev/null | sort --version-sort)

Indagatoria.pdf: meta.yaml $(SOURCE)
	pandoc -t pdf -o $@ --metadata-file=$^ --bibliography=./bibliography.bib --pdf-engine=xelatex --citeproc --csl=./ieee.csl

show: Indagatoria.pdf
	zathura $<
