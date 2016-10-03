browsers
accumulator
	"| window browser |
	browser := self new accumulator.
	window := browser openOn: MooseModel root allModels first allModelClasses.
	(browser panes first port: #selection) 
		value: (MooseModel root allModels first allModelClasses entityNamed: 
			#'org::argouml::uml::diagram::deployment::ui::FigNodeInstance').
	(browser panes first port: #selection) 
		value: (MooseModel root allModels first allModelClasses entityNamed: 
			#'org::argouml::uml::diagram::ui::FigNodeModelElement').
	World doOneCycle.
	World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: 'accumulator.png'.	"
| browser |
browser := GLMTabulator new.
browser column: #list; column: #details span: 2.
browser title: 'Class Viewer'.
browser transmit to: #list; andShow: [ :a | 
  a list 
    format: #name;
    title: 'Classes' ].
browser transmit to: #details; from: #list; andShowIfNone: [ :a |
  | accumulator |
  accumulator := GLMAccumulator new.
  accumulator show: [ :some | 
    some title: #name.
    some text 
      display: #formattedSourceText ].
  a custom: accumulator ].
^ browser