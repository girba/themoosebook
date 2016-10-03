visualizations
systemComplexity
	
	| view window |
	view := MOViewRenderer new.
	(MooseModel root allModels first allModelClasses select: [:each | each isInterface not]) 		viewSystemComplexityOn: view.
	window := view open.
	PNGReadWriter putForm: view canvas imageForm onFileNamed: 'system-complexity.png'.
	window delete