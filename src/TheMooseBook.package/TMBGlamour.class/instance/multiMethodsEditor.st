examples
multiMethodsEditor
	"| window browser classes |
	browser := self new multiMethodsEditor.
	classes := (MooseModel root allModels first allModelClasses select: [:each | 
		'org::argouml::uml::diagram*' match: each mooseName]).
	window := browser openOn: classes.
	(browser panes first port: #selection) value: (classes entityNamed: 'org::argouml::uml::diagram::ui::ArgoFigText').
	(browser panes second port: #selection) value: ((classes entityNamed: 'org::argouml::uml::diagram::ui::ArgoFigText') methods asOrderedCollection copyFrom: 2 to: 4).
	World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: 'glamour-dynamic-example.png'.
"
	| browser composite |
	browser := GLMTabulator new.
	browser title: 'Multi Methods Viewer'.
	browser 
		column: [:c | c row:  #classes; row: #methods];
		column: #source.
	browser transmit to: #classes; andShow: [:a  |
		a list 
			title: 'Classes';
			display: [:model | model allClasses ] ].
	browser transmit to: #methods; from: #classes; andShow: [:a |
		a list 
			title: [ :class | 'Methods from ', class name ];
			beMultiple; 
			display: [ :class | class methods ];
			format: #name ].
	browser transmit to: #source; from: #methods; andShow: [:a |
		a dynamic with: [ :some :methods | 
			methods do: [:each |
				some text 
					title: each name asString;
					display: [:x | each sourceText] ].
			some stackedArrangement ] ].
	^ browser 