building
compose
	self tabulator with: [ :t | 
		t 
			column: [ :c | c row: #files; row: #index ];
			column: #editor span: 3.
		t transmit
			to: #files;
			andShow: [ :a | self filesIn: a ].
		t transmit
			from: #editor port: #rootNestedHeader;
			to: #index;
			andShow: [ :a | self indexIn: a ].
		t transmit
			from: #files;
			to: #editor;
			andShow: 	[ :a :file | self editorIn: a forFile: file ].
		t transmit
			from: #editor;
			toWatcher;
			andShow: 	[ :a :file | 
				file gtInspectorPresentationsIn: a inContext: GTInspector new ] ]