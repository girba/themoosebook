action
inActionWithTwoPanesAndOnePresentation
GLMCompositePresentation new tabulator with: [ :t |
	t column: #index; column: #details.
	t transmit to: #index; andShow: [ :composite | 
		composite list
			title: 'Projects';
			format: [:each | each parent basename] ].
	t transmit from: #index; to: #details; andShow: [ :composite |
		composite text
			title: 'XML';
			display: [ :file | file contents ] ]
	];
	openOn: (MooseModel root allModels anyOne rootFolder asFileReference
 allFiles select: [ :each | each basename = 'build.xml' ]).
