examples
presentationTableExample
	| browser |
	browser := GLMTabulator new.
	browser column: #namespaces.
	browser transmit to: #namespaces; andShow: [ :a |
	   a table
	      display: [ :model | model allNamespaces ];
	      column: 'Namespaces' evaluated: [ :each | each mooseName ];
	      column: 'NOCls' evaluated: [ :each | each classes size asString ];
	      format: [ :namespace | namespace stubFormattedName ] ].
	browser openOn: MooseModel root allModels anyOne.