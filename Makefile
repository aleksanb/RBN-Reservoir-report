file = forprosjekt-report.tex
bibfile = forprosjekt-report.aux
pdffile = $(file:.tex=.pdf)

.PHONY: all
all: build

.PHONY: guard
guard:
	bundle exec guard

.PHONY: build
build: clean
	pdflatex $(file)
	bibtex $(bibfile)
	pdflatex $(file)
	pdflatex $(file)

.PHONY: upload
upload:
	bash -i -c "upload $(pdffile)"

.PHONY: open
open:
	evince $(pdffile) &

.PHONY: clean
clean:
	rm -f *.aux *.bbl *.blg *.xml *.log *blx.bib *blg *blg *.tdo
