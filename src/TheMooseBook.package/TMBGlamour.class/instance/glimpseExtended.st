examples
glimpseExtended
	| browser |
	browser := GLMTabulator new.
	browser
		row: [ :r | r column: #namespaces; column: #classes; column: #methods ];
		row: #details.
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

	browser openOn: MooseModel root allModels anyOne.