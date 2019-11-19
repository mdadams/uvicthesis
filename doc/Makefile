LATEX_SOURCES = \
  main.tex \
  introduction.tex \
  background.tex \
  conclusions.tex \
  results.tex \
  uvicthesis.cls \

all: figures main.pdf main.ps
.PHONY: all

main.pdf: $(LATEX_SOURCES)

clean: clean_local figures-clean
.PHONY: clean

mostlyclean: clean-local
.PHONY: mostlyclean

.PHONY: clean-local
clean_local:
	rm -f *.bak *.lot *.lof *.lol *.blg *.log *.aux *.fff *.bbl *.ttt *.toc
	rm -f *.idx *.ind *.ilg *.alg *.cut *.brf
	rm -f *.ps *.pdf *.nca *.out
	rm -f *.fdb_latexmk *.fls
	rm -rf *.outdir
	latexmk -C

figures:
#	for i in figures; do \
#		(cd $$i && $(MAKE) -$(MAKEFLAGS) all) || exit 1; \
#	done
#.PHONY: figures

figures-clean:
#	for i in figures; do \
#		(cd $$i && $(MAKE) -$(MAKEFLAGS) clean) || exit 1; \
#	done
#.PHONY: figures-clean

################################################################################
# Do not modify anything below this line.
################################################################################

LATEXMK = latexmk
PDFTOPS = pdftops

.tex.pdf:
	$(LATEXMK) -pdf -bibtex -logfilewarninglist -outdir=$*.outdir $<
	cp $*.outdir/main.pdf .

.pdf.ps:
	$(PDFTOPS) $< $@

.SUFFIXES: .tex .pdf .ps
