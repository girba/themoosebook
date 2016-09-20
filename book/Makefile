OUTPUTDIRECTORY = ./book-result
LATEXTEMPLATE = ./support/templates/latex.mustache.template
HTMLTEMPLATE = ./support/templates/html.mustache.template

EPUBMAKEFILE = ./support/makefiles/epub.mk

include $(EPUBMAKEFILE)
include ./support/makefiles/copySupport.mk

book: book-result/book.pdf book-result/book.html

initDir:
	mkdir -p $(OUTPUTDIRECTORY)

#Tex compilation
$(OUTPUTDIRECTORY)/%.tex.json: %.pillar copySupport
	./pillar export --to="LaTeX" --outputDirectory=$(OUTPUTDIRECTORY) --outputFile=$< $<

$(OUTPUTDIRECTORY)/%.tex: $(OUTPUTDIRECTORY)/%.tex.json
	./mustache --data=$< --template=${LATEXTEMPLATE} > $@

$(OUTPUTDIRECTORY)/%.pdf: $(OUTPUTDIRECTORY)/%.tex
	latexmk -outdir=${OUTPUTDIRECTORY} -use-make -pdf $<
	make cleanBookResult

#HTML compilation
$(OUTPUTDIRECTORY)/%.html.json: %.pillar copySupport
	./pillar export --to="HTML" --outputDirectory=$(OUTPUTDIRECTORY) --outputFile=$< $<

$(OUTPUTDIRECTORY)/%.html: $(OUTPUTDIRECTORY)/%.html.json
	./mustache --data=$< --template=${HTMLTEMPLATE} > $@

#cleaning
cleanWorkspace: clean
	rm -r ${OUTPUTDIRECTORY} || true

cleanBookResult:
	rm ${OUTPUTDIRECTORY}/*.aux ${OUTPUTDIRECTORY}/*.fls ${OUTPUTDIRECTORY}/*.log ${OUTPUTDIRECTORY}/*.fdb_latexmk ${OUTPUTDIRECTORY}/*.listing ${OUTPUTDIRECTORY}/*.nav ${OUTPUTDIRECTORY}/*.out ${OUTPUTDIRECTORY}/*.snm ${OUTPUTDIRECTORY}/*.toc ${OUTPUDIRECTORY}/*.vrb
