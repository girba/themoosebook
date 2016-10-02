visualizations
sideBySideDuplications

	| classGroup view window |
	classGroup := MooseModel root allModels first allModelClasses select: [:each | 
		'org::argouml::uml::diagram*' match: each mooseName ].
	view := MOViewRenderer new.
	classGroup viewSideBySideDuplicationsOn: view.
	window := view open.
	PNGReadWriter putForm: view canvas imageForm onFileNamed: 'side-by-side-duplication.png'.
	window delete