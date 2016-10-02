browsers
diffBrowser
	"| window |
	window := self new diffBrowser.
	World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: 'glamour-diff-browser.png'"
	
	| browser window browserImpl |

	browserImpl := MooseBrowsers new.
	browserImpl computeChildrenHierarchy: MooseModel meta.
	browser := browserImpl browser.
	window := browser openOn: MooseModel meta.
	(browser panes first presentations first panes first port: #selection) 
		value: FAMIXNamedEntity asMooseDescription.
	(browser panes first presentations first panes last port: #selection) 
		value: (FAMIXNamedEntity asMooseDescription allComplexAttributes detect: [:each | 
					each name = #sourceAnchor]).
	^ window