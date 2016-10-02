examples
presentationDiffExample
"| window browser |
	browser := self new presentationDiffExample.
	window := browser openOn: MooseModel root allModels anyOne allDuplications.
	(browser panes first port: #selection) value: (browser panes first port: #entity) value first.
	World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: 'glamour-diff-presentation.png'"

| browser |
browser := GLMTabulator new.
browser title: 'Duplication Browser'.
browser row: #duplications; row: #diff span: 2.
browser showOn: #duplications; using: [browser list].
browser showOn: #diff; from: #duplications; using: [
  browser diff display: [:dup | 
    Array with: dup referenceText with: dup duplicateText ]].
^ browser