as yet unclassified
computeResult
	^ self model allModelNamespaces select: [:each | 
		each classes anySatisfy: [:class | '*Facade*' match: class name] ]