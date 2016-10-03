visiting-document
nestHeader: aHeader
	| nestedHeader |
	nestedHeader := TMBHTMLHeaderNesting new header: aHeader.
	[ aHeader level <= headerStack top header level ] whileTrue: [ headerStack pop ].
	headerStack top children add: nestedHeader.
	headerStack push: nestedHeader