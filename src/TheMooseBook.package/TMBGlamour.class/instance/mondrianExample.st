examples
mondrianExample
	"
	| window browser |
	browser := self new mondrianExample.
	window := browser openOn: MooseModel root allModels anyOne.
	(browser panes first port: #selection) value: 
		(MooseModel root allModels anyOne allModelClasses entityNamed: #'org::argouml::model::mdr::UndoCoreHelperDecorator').
	World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: 'glamour-mondrian-example.png'.
	"
	| browser |
	browser := GLMTabulator new.
	browser title: 'Complexity Previewer'.
	browser column: #complexity span: 3; column: #blueprint.
	browser transmit to: #complexity; andShow: [:a | 
		a mondrian 
			painting: [ :view :model | 
				(model allModelClasses reject: #isInterface) viewSystemComplexityOn: view ]].
	browser transmit from: #complexity; to: #blueprint; andShow: [:a | 
		a mondrian 
			painting: [ :view :class | 
				class viewBlueprintOn: view ];
			whenKindOf: FAMIXClass
		].
	^ browser