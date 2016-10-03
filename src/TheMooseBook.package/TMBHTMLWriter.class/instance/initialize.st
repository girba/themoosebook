initalize
initialize
	super initialize.
	headerStack := Stack new.
	rootHeader := TMBHTMLHeaderNesting new header: (PRHeader new level: 0).
	headerStack push: rootHeader