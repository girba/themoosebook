as yet unclassified
computeDuplication
	| classes |
	classes := MooseModel root allModels first allModelClasses select: [:each | 
		each isInterface not and: [
			each name asNumber isZero ] ].
	classes computeDuplication.