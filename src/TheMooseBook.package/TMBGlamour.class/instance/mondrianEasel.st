examples
mondrianEasel
	"self new mondrianEasel openOn: 'view shape label.
view nodes: (1 to: 40).
view edgesFrom: [:x | x // 3 ].
view treeLayout'"
	| browser |
	browser := GLMTabulator new.
	browser title: 'Simple Mondrian Easel'.
	browser row: #painting span: 10; row: #script span: 4.
	browser transmit to: #script; andShow: [ :a |
		a text
			forSmalltalk;
			title: 'Mondrian script';
			display: [:script | script ];
			populate: #selection icon: GLMUIThemeExtraIcons glamorousAccept on: $o entitled: 'Generate View' with: [:text | text text ] ].
	browser transmit to: #painting; from: #script; andShow: [ :a |
		a mondrian
			title: 'Mondrian painting';
			painting: [ :view :script | 
						(Compiler evaluate: 'view := self.', script for: view logged: false)  ];
			act: [:m | m canvas exportAsPNG] entitled: 'Export as PNG';
			act: [:m | 
				m canvas root decreaseZoom.
				m canvas  changed ] 
			icon: MondrianIcons mondrianZoomOut
			entitled: 'Zoom out';
			act: [:m | 
				m canvas root increaseZoom.
				m canvas root updateWindow ] 
			icon: MondrianIcons mondrianZoomIn 
			entitled: 'Zoom in'].
	^ browser