export SHELL = /bin/bash
main   = main
apps   = appendices
inputs = $(wildcard *.tex) $(wildcard *.sty)
regex_app = bibdata
regex_citation = "\\citation{"
LATEX = pdflatex
extra = $(wildcard *.sty) llncs.cls

all: $(main).pdf

.PHONY: clean distclean

main.pdf: prezentacja.tex 
#	pdflatex prezentacja || (rm -f prezentacja.pdf prezentacja.aux; false)
#	pdflatex prezentacja || (rm -f prezentacja.pdf prezentacja.aux; false)
	pdflatex prezentacja

clean:
	rm -f *.gz *.backup *.pdf *.aux *.log *~ *.out *.bbl *.blg *.skim.pdf *.toc *.vrb *.nav xx* *.snm 

distclean: clean
	rm -f $(pdfs) $(main).pdf version.tex
