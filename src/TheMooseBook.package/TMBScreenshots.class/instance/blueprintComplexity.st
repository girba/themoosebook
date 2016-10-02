visualizations
blueprintComplexity
	
	| view window |
	view := MOViewRenderer new.
	(MooseModel root allModels first allModelClasses entityNamed: #'org::argouml::uml::diagram::ui::ArgoFigGroup') 
		withSubclassHierarchyGroup viewBlueprintOn: view.
	window := view open.
	PNGReadWriter putForm: view canvas imageForm onFileNamed: 'blueprint-complexity.png'.
	window delete