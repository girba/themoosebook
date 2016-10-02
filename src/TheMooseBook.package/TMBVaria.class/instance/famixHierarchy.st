as yet unclassified
famixHierarchy
	"self new famixHierarchy"
	
	| view edges famixClasses |
	famixClasses := MooseModel meta classes select: [:fameClass | 
		(fameClass package name == #FAMIX) and: [(fameClass name includesSubString: 'Group') not]].
	
	view := MOViewRenderer new.	
	view interaction draggable.
	view shape label text: #name.
	view nodes: famixClasses.
	view edgeShape:  MOOrthoHorizontalLineShape new.
	edges := view edgesFrom: #superclass.
	view shape line color: Color veryVeryLightGray.
	view edges: famixClasses from: #yourself toAll: [:each | 
		each attributes collect: #type ].
	view horizontalTreeLayout verticalGap: 10; userDefinedEdges: edges.
	view open