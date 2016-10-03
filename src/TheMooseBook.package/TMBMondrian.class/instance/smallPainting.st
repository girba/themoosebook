visualizations
smallPainting
	
	| view window namespaces |
	namespaces := MooseModel root allModels first allNamespaces.
	view := MOViewRenderer new.
	view shape rectangle
	  width: [:each | each numberOfClasses / 10];
	  height: [:each | each numberOfMethods / 10];
	  linearFillColor: #numberOfLinesOfCode within: namespaces.
	view nodes: namespaces.
	view shape line color: Color veryVeryLightGray.
	view edgesToAll: [ :each | each providerNamespaces ].
	view dominanceTreeLayout.
	window := view open.
	PNGReadWriter putForm: view canvas imageForm onFileNamed: 'small-painting.png'.
	window delete