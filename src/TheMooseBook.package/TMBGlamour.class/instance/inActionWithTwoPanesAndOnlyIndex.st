action
inActionWithTwoPanesAndOnlyIndex
GLMCompositePresentation new tabulator with: [ :t |
	t column: #index; column: #details.
	t transmit to: #index; andShow: [ :composite | 
		composite list
			title: 'Projects';
			format: [:each | each parent basename] ].
	];
	openOn: (MooseModel root allModels anyOne rootFolder asFileReference
 allFiles select: [ :each | each basename = 'build.xml' ]).
