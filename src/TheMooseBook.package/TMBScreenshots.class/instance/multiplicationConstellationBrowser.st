browsers
multiplicationConstellationBrowser
	"| window |
	window := self new multiplicationConstellationBrowser.
	PNGReadWriter putForm: window imageForm onFileNamed: 'browser-multiplication-constellation.png'"
	
	| browser window |

	browser := MooseBrowsers new multiplicationConstellationBrowser.

	window := browser 
		screenshot: 'browser-multiplication-constellation.png' 
		on: (MooseModel root allModels last allMultiplications select: #isComplex)
		after: [ :b | 
		].
	^ window