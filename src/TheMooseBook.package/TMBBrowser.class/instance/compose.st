building
compose
	self tabulator with: [ :t |
		t 
			column: [ :c | c row: #files; row: #index];
		 	column: #editor span: 3.
		t transmit to: #files; andShow: [ :a |
			a list 
				title: 'Files';
				format: [ :each | each parent basename, '/', each basename ] ].
		t transmit from: #files; to: #editor; andShow: [ :a :file |
			file gtInspectorPillarIn: a ].
		t transmit from: #editor; toWatcher; andShow: [ :a :file | 
			file gtInspectorPresentationsIn: a inContext: GTInspector new ] ]