browsers
accumulatorWithSpecialPorts
	"| window browser |
	browser := self new accumulatorWithSpecialPorts.
	window := browser openOn: MooseModel root allModels first allModelClasses.
	(browser panes first port: #selection) 
		value: (MooseModel root allModels first allModelClasses entityNamed: 
			#'org::argouml::uml::diagram::deployment::ui::FigNodeInstance').
	(browser panes first port: #selection) 
		value: (MooseModel root allModels first allModelClasses entityNamed: 
			#'org::argouml::uml::diagram::ui::FigNodeModelElement').
	World doOneCycle."
| browser |
browser := GLMTabulator new.
browser column: #list; column: #details span: 2.
browser title: 'Class Viewer'.
browser transmit to: #list; andShow: [ :a | 
  a list 
    format: #name;
    title: 'Classes' ].
browser transmit to: #details; from: #list port: #strongSelection; andShowIfNone: [ :a |
  | accumulator |
  accumulator := GLMAccumulator new.
  accumulator show: [ :some | 
    some title: #name.
    some text 
      display: #formattedSourceText ].
  a custom: accumulator ].
browser transmit to: #details port: #entityToSelect; from: #list. 
browser transmit to: #list port: #selection; from: #details port: #activeEntity. 
^ browser