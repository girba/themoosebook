examples
presentationTreeExample
	| browser |
	browser := GLMTabulator new.
	browser column: #namespaces.
	browser transmit to: #namespaces; andShow: [ :a |
	   a tree
	      display: [ :model | model allNamespaces select: [ :each | each isRoot ] ];
	      children: [ :namespace | namespace childScopes ];
	      format: [ :namespace | namespace stubFormattedName ] ].
	browser openOn: MooseModel root allModels anyOne.