visualizations
namespaceDependencies
	
	| view window namespaces |
	namespaces := MooseModel root allModels first allModelNamespaces.
	view := MOViewRenderer new.
	namespaces viewDependenciesOn: view.
	window := view open.
	PNGReadWriter putForm: view canvas imageForm onFileNamed: 'namespace-dependencies.png'.
	window delete