building
filesIn: a
	^ a list
		title: 'Files';
		format: [ :each | each parent basename , '/' , each basename ]