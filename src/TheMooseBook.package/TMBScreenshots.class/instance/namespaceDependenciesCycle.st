visualizations
namespaceDependenciesCycle
	
	| view window namespaces |
	namespaces := MooseModel root allModels first allModelNamespaces.
	view := MOViewRenderer new.
	namespaces viewDependenciesWithCyclesOn: view.
	window := view open.
	PNGReadWriter putForm: view canvas imageForm onFileNamed: 'namespace-dependencies-cycles.png'.
	window delete