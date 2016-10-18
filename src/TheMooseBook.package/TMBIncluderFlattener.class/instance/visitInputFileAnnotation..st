visiting-annotations
visitInputFileAnnotation: anInputFileAnnotation
	| file |
	file := anInputFileAnnotation fileRelatedToBaseDirectory: baseDirectory.
	