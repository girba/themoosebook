examples
glimpse
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

	browser transmit from: #methods; to: #details; andShow: [ :a |
	   a text
	      display: [ :method | method sourceText ] ].

	browser openOn: MooseModel root allModels anyOne.