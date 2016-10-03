action
inActionWithTwoPanesAndThreePresentations
GLMCompositePresentation new tabulator with: [ :t |
	t column: #index; column: #details.
	t transmit to: #index; andShow: [ :composite | 
		composite list
			title: 'Projects';
			format: [:each | each parent basename] ].
	t transmit from: #index; to: #details; andShow: [ :composite |
		composite text
			title: 'XML';
			display: [ :file | file contents ].
		composite list 
			title: 'Targets';
			display: [ :file | (XMLDOMParser parse: file contents) // 'target' ];
			format: [ :xmlElement | xmlElement attributeAt: 'name' ].
		composite roassal2
			title: 'Dependencies';
			initializeView: [ RTMondrian new ];
			painting: [ :view :file | 
				| tags |
				tags := (XMLDOMParser parse: file) // 'target'.
				view shape label text: [:each | (each @ 'name') stringValue].
				view nodes: tags.
				view shape line color: (Color gray alpha: 0.5).
				view edges connectFromAll:  [:aTag | |depends|
					depends:=(aTag @ 'depends') stringValue splitOn: ', '.
					tags select: [ :each | 
						depends includes: (each @ 'name') stringValue] ].
				view layout horizontalDominanceTree.
				] ].
	];
	openOn: (MooseModel root allModels anyOne rootFolder asFileReference
 allFiles select: [ :each | each basename = 'build.xml' ]).
