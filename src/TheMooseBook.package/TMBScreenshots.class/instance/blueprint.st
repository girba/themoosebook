visualizations
blueprint
	
	| view window |
	view := MOViewRenderer new.
	(MooseModel root allModels first allModelClasses entityNamed: #'org::argouml::kernel::ProjectImpl') 
		viewBlueprintOn: view.
	window := view open.
	PNGReadWriter putForm: view canvas imageForm onFileNamed: 'blueprint.png'.
	window delete