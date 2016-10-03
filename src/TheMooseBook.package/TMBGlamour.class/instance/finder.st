browsers
finder
	| finder window |
	finder := GLMFinder new.
	finder title: 'Namespace dependencies'.
	finder fixedSizePanes: 3.
	finder show: [ :a |
		a list 
			format: #mooseName;
			send: #providerNamespaces ].
	finder 
		screenshot: 'finder.png' 
		on: MooseModel root allModels first allModelNamespaces
		after: [ :b |
			(b panes first port: #selection) 
				value: (MooseModel root allModels first allModelNamespaces entityNamed: 
							#'org::argouml::application') providerNamespaces.
			 ]
