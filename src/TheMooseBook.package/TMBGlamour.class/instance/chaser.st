examples
chaser
	" | window browser |
	browser := self new chaser.
	window := browser openOn: (MooseModel root allModels first allMethods entityNamed: #'org::argouml::model::Facade.getName()').
	browser panes first presentations first panes first presentations first selection: (MooseModel root allModels first allMethods entityNamed: #'org::argouml::language::cpp::generator::GeneratorCpp.addDependency()').
	World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: 'glamour-chaser.png'.
	"

	| browser innerBrowser |

	innerBrowser := GLMTabulator new.
	innerBrowser row: #methods; row: #source.
	innerBrowser transmit to: #methods; andShow: [ :a | 
		a list
			title: [:each | 'Methods invoking ', each name ];
			display: [ :each | 
				each invokingMethods asSortedCollection: [:x :y | x mooseName < y mooseName ] ];
			format: #mooseName ].
	innerBrowser transmit from: #methods; to: #source; andShow: [:a |
		a text display: [:entity | entity sourceText ] ].
	innerBrowser transmit from: #methods; toOutsidePort: #selection.
	
	browser  := GLMFinder new.
	browser title: [:each | 'Chaser on ', each mooseName ].
	browser show: [:a |
		a custom: innerBrowser ].
	^ browser