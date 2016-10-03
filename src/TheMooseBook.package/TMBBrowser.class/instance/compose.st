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
		t transmit from: #editor port: #rootNestedHeader; to: #index; andShow: [ :a | 
			a tree
				title: 'Index';
				display: [ :root | root children ];
				children: #children;
				format: [ :header | PRTextWriter write: header header ] ].
		t transmit from: #files; to: #editor; andShow: [ :a :file |
			(file gtInspectorPillarIn: a)
				onChangeOfPort: #text act: [ :textPresentation |
					activeParserProcess ifNotNil: [ :p | p terminate ].
					activeParserProcess := 
							[
								| writer |
								writer := TMBHTMLWriter new.
								[writer write: (PRPillarParser parse: textPresentation text asString)]
									on: PRLinkWarning do: [:e | e resume ].
								(textPresentation pane port: #rootNestedHeader) value: writer rootNestedHeader 
							] forkAt: Processor userBackgroundPriority - 1] ].
		t transmit from: #editor; toWatcher; andShow: [ :a :file | 
			file gtInspectorPresentationsIn: a inContext: GTInspector new ].
		 ]