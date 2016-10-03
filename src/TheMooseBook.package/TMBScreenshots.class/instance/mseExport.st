browsers
mseExport
	| browser window |
	browser := MoosePanel new browser.
	window := browser openOn: MooseModel root allModels.
	(browser panes first port: #selection) value: MooseModel root allModels first.
	(browser panes first port: #strongSelection) value: MooseModel root allModels first.
	PNGReadWriter putForm: window imageForm onFileNamed: 'mse-export.png'.
	window delete