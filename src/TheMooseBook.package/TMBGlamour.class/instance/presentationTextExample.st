examples
presentationTextExample
	| browser |
	browser := GLMTabulator new.
	browser column: #source.
	browser transmit to: #source; andShow: [ :a |
	   a text
	      display: [ :class | class sourceText ] ].
	browser openOn: (MooseModel root allModels anyOne allClasses entityNamed: #'org::argouml::kernel::ProjectImpl').