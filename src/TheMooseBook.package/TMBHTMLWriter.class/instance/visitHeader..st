visiting-document
visitHeader: aHeader
	| level |
	"h1 to h7 exist."
	level := aHeader level min: 7 max: 1.
	self nestHeader: aHeader.
	canvas tag
		name: 'h' , level asString;
		parameterAt: 'id' put: aHeader htmlId;
		with: [ self visitDocumentGroup: aHeader ].
	canvas newLine