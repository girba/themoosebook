browsers
finderOnModel
	| browser window finder accumulator |
	browser := MoosePanel new browser.
	window := browser openOn: MooseModel root.
	((browser paneNamed: #models) port: #selection) value: MooseModel root allModels first.
	"World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: 'finder-on-model.png'.
	"
	accumulator := (browser paneNamed: #details) presentations first.
	accumulator panes first presentations first panes first presentations first selection: MooseModel root allModels first allModelClasses