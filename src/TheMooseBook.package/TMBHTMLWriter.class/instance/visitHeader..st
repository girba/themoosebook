visiting-document
visitHeader: aHeader
	| level |
	"h1 to h7 exist."
	level := aHeader level min: 7 max: 1.
	canvas tag
		name: 'h' , level asString;
		parameterAt: 'id' put: aHeader htmlId;
		with: [ 
			self writeCounterForHeader: aHeader.
			super visitHeader: aHeader ].
	canvas newLine