as yet unclassified
gtDisplayOn: stream
	super gtDisplayOn: stream.
	stream nextPutAll: ((PRPillarWriter write: header) printStringLimitedTo: 2000)