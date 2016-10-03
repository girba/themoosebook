examples
classicChaser
	" | window browser |
	browser := self new classicChaser.
	window := browser openOn: (MooseModel root allModels first allMethods entityNamed: #'org::argouml::model::Facade.getName()').
	browser panes first presentations first panes first presentations first selection: (MooseModel root allModels first allMethods entityNamed: #'org::argouml::language::cpp::generator::GeneratorCpp.addDependency()').
	World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: 'glamour-classic-chaser.png'.
	"

| browser innerBrowser |

innerBrowser := GLMFinder new.
innerBrowser show: [:a | 
  a list
    title: [:each | 'Methods invoking ', each name ];
    display: #invokingMethods ;
    format: #mooseName.
].

browser := GLMTabulator new.
browser title: [:each | 'Classic chaser on ', each mooseName ].
browser row: #methods; row: #source.
browser transmit to: #methods; andShow: [ :a | 
  a custom: innerBrowser ].
browser transmit from: #methods; to: #source; andShow: [:a |
  a text display: #sourceText ].
^ browser