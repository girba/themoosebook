as yet unclassified
viewFacadeNamespaces: facadeNamespaces on: view
	view shape label 
		text: #name; 
		fontColor: [:each |
			(facadeNamespaces includes: each)
				ifTrue: [Color blue] 
				ifFalse: [Color gray]].
	view nodes: (self model allNamespaces select: [:each | 'org::argouml*' match: each mooseName ]).
	view shape horizontalOrthogonalLine.
	view edgesFrom: #parentScope.
	view horizontalTreeLayout 