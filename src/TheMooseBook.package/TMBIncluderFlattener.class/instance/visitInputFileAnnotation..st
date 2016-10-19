visiting-annotations
visitInputFileAnnotation: anInputFileAnnotation
	| file includedFileNode |
	file := anInputFileAnnotation fileRelatedToBaseDirectory: baseDirectory.
	includedFileNode := PRPillarParser parse: file contents.
	self replace: {includedFileNode}