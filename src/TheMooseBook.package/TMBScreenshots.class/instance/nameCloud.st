visualizations
nameCloud
	| namespace view window |
	namespace := MooseModel root allModels first allNamespaces entityNamed: #'org::argouml::uml::diagram'.
	view := MOViewRenderer new.
	namespace allRecursiveClassesGroup viewNameCloudOn: view.
	window := view open.
	PNGReadWriter putForm: view canvas imageForm onFileNamed: 'visualization-classes-name-cloud.png'.
	window delete