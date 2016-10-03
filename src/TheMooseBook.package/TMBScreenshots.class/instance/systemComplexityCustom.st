visualizations
systemComplexityCustom
	| view window browser classes |
	classes := MooseModel root allModels first allModelClasses reject: #isInterface.
	browser := MooseBrowsers new systemComplexityWizard.
	window := browser openOn: ( 
		classes ->
		(classes first primitivePropertySelectors select: [:each | 
					(classes first perform: each) isNumber ])).
	(browser pane port: #heightToSelect) value: #numberOfMethods.
	(browser pane port: #widthToSelect) value: #numberOfAttributes.
	(browser pane port: #colorToSelect) value: #numberOfLinesOfCode.
	World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: 'visualization-system-complexity-custom.png'.
	window delete