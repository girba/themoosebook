examples
glimpseEmbedded
	| argoModel navigator browser |
	argoModel := MooseModel root allModels first.
	navigator := GLMTabulator new.
	navigator column: #namespaces; column: #classes; column: #methods.
	navigator transmit to: #namespaces; andShow: [:a | 
		a tree
			display: [:model | model allNamespaces select: #isRoot ];
			children: [:namespace | namespace childScopes ];
			format: #name].
	navigator transmit from: #namespaces; to: #classes; andShow: [:a |
		a list 
			title: 'Classes';
			display: [:namespace | namespace classes ];
			format: #name.
		a mondrian 
			title: 'Hierarchy';
			painting: [:view :namespace |
				view shape rectangle height: #numberOfMethods; linearFillColor: #numberOfLinesOfCode within: namespace classes.
				view interaction menu: #mooseMenuMorph.
				view nodes: namespace classes.
				view edgesFrom: #superclass.
				view treeLayout verticalGap: 5
				] ].
	navigator transmit from: #classes; to: #methods; andShow: [:a |
		a list 
			display: [:class | class methods ];
			format: #name ].
	navigator transmit from: #classes; toOutside: #class.

	browser := GLMTabulator new.
	browser row: #navigation; row: #details.
	browser transmit to: #navigation; andShow: [:a | 
		a custom: navigator].
	browser transmit to: #details; from: #navigation->#class; andShow: [:a | 
		a text 
			display: [:class | class sourceText ]].
	browser openOn: argoModel.