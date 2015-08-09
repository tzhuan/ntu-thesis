MAIN=thesis
LIBVERSION=thesis-lib
LATEX=xelatex
BIBTEX=bibtex
RM=rm -f

# use your own password
PDF_PWD=rdkRq8u8lAzARCIPa8Us

# files to compile
files := $(wildcard *.tex) ntuthesis.cls thesis.bib
# content files
files := $(files) $(wildcard chapters/*.tex) $(wildcard tables/*.tex) $(wildcard figures/*.tex)
# embeded files
files := $(files) $(wildcard images/*) $(wildcard pdfs/*.pdf)

.SUFFIXES: .tex

all: $(MAIN).pdf

$(MAIN).pdf: $(files) src/without-watermark.tex
	cp src/without-watermark.tex watermark.tex
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(RM) watermark.tex

ntulib: pdfs/watermark.pdf src/with-watermark.tex $(files)
	cp src/with-watermark.tex watermark.tex
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)
	pdftk $(MAIN).pdf output $(LIBVERSION).pdf owner_pw $(PDF_PWD) allow Printing allow ScreenReaders
	$(RM) watermark.tex

pdfs:
	mkdir pdfs

pdfs/watermark.pdf: | pdfs
	curl "http://etds.lib.ntu.edu.tw/files/watermark.pdf" -o "pdfs/watermark.pdf"

clean:
	$(RM) *.log *.aux *.dvi *.lof *.lot *.toc *.bbl *.blg *.out

clean-pdf:
	$(RM) *.pdf

clean-all: clean clean-pdf

setup:
	sudo apt-get install texlive texlive-xetex texlive-latex-recommended texlive-latex-extra texlive-bibtex-extra texlive-science texlive-humanities pdftk curl
