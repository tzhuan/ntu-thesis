MAIN=thesis
LIBVERSION=thesis-lib
LATEX=xelatex
BIBTEX=bibtex
RM=rm -f

# use your own password
PDF_PWD=rdkRq8u8lAzARCIPa8Us

.SUFFIXES: .tex

all: $(MAIN).pdf

$(MAIN).pdf: *.tex ntuthesis.cls
	cp without-watermark.tex watermark.tex
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(RM) watermark.tex

ntulib: pdfs/watermark.pdf *.tex ntuthesis.cls
	cp with-watermark.tex watermark.tex
	$(LATEX) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)
	pdftk $(MAIN).pdf output $(LIBVERSION).pdf owner_pw $(PDF_PWD) allow Printing allow ScreenReaders
	$(RM) watermark.tex

pdfs:
	mkdir pdfs

pdfs/watermark.pdf: pdfs
	wget http://etds.lib.ntu.edu.tw/files/watermark.pdf -O pdfs/watermark.pdf

clean:
	$(RM) *.log *.aux *.dvi *.lof *.lot *.toc *.bbl *.blg

clean-pdf:
	$(RM) *.pdf

clean-all: clean clean-pdf

setup:
	sudo apt-get install texlive texlive-xetex texlive-latex-recommended texlive-latex-extra texlive-bibtex-extra texlive-science texlive-humanities pdftk
