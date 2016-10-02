browsers
metaBrowser
	"| window |
	window := self new metaBrowser.
	PNGReadWriter putForm: window imageForm onFileNamed: 'meta-browser.png'"
	
	| browser window browserImpl |

	browserImpl := MooseMetaBrowser new.
	browserImpl computeChildrenHierarchy: MooseModel meta.
	browser := browserImpl browser.
	window := browser openOn: MooseModel meta.
	(browser panes first presentations first panes first port: #selection) 
		value: FAMIXSourcedEntity asMooseDescription.
	(browser panes first presentations first panes last port: #selection) 
		value: (FAMIXSourcedEntity asMooseDescription allComplexAttributes detect: [:each | 
					each name = #sourceAnchor]).
	World doOneCycle.
	^ window