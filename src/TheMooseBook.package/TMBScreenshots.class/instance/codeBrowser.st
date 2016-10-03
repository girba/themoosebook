browsers
codeBrowser
	"| window |
	window := self new diffBrowser.
	World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: 'glamour-diff-browser.png'"
	
	| browser |

	browser := MooseBrowsers new codeWithAnnotationsBrowser.
	browser openOn: MooseModel root allModels first.
	browser panes first presentations first selection: (MooseModel root allModels first allNamespaces entityNamed: #'org::argouml::ocl').
	browser panes second presentations first selection: (MooseModel root allModels first allModelClasses entityNamed: #'org::argouml::ocl::OCLEvaluator').