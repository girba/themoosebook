examples
glimpseExtendedWithReview
"	| window browser |
	browser := self new glimpseExtendedWithReview.
	window := browser openOn: MooseModel root allModels anyOne.
	(browser panes first port: #selection) value: (MooseModel root allModels anyOne allNamespaces entityNamed: #'org::argouml::persistence').
	(browser panes second port: #selection) value: (MooseModel root allModels anyOne allClasses entityNamed: #'org::argouml::persistence::ArgoParser').
	World doOneCycle.
	World doOneCycle.
	World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: 'glamour-magritte-presentation.png'
"	
| browser |
browser := GLMTabulator new.
browser title: 'Reviewer'.
browser
  row: [ :r | r column: #namespaces; column: #classes; column: #methods ];
  row: [:r  | r column: #details span: 2; column: #review ].
browser transmit to: #namespaces; andShow: [ :a |
  a tree
    display: [ :model | model allNamespaces select: [ :each | each isRoot ] ];
    children: [ :namespace | namespace childScopes ];
    format: [ :namespace | namespace stubFormattedName ] ].
browser transmit from: #namespaces; to: #classes; andShow: [ :a |
  a list
    display: [ :namespace | namespace classes ];
    format: [ :class | class stubFormattedName ] ].

browser transmit from: #classes; to: #methods; andShow: [ :a |
   a list
      display: [ :class | class methods ];
      format: [ :method | method stubFormattedName ] ].

browser transmit from: #classes; from: #methods; to: #details; andShow: [ :a |
  a text
    title: [ :class | class name, ' source'];
    display: [ :class | class sourceText ];
    allowNil.
  a text
 	    title: [ :class :method | method name, ' source'];
    display: [ :class :method | method sourceText ] ].
browser transmit from: #classes; to: #review; andShow: [:a | 
  a magritte 
    title: 'Review';
    display: [ :class |
      | review |
      review := class propertyNamed: #theReview ifAbsentPut: [TMBReview new].
      review ];
    description: #description].
^ browser 