as yet unclassified
browser
	| browser |
	
	browser := GLMTabulator new.
	browser column: #map; column: #code.
	browser transmit to: #map; andShow: [:a | 
		a mondrian
			title: 'Package map';
			painting: [:view :facadeNamespaces | 
				self viewFacadeNamespaces: facadeNamespaces on: view ]].
	browser transmit to: #code; from: #map; andShow: [:a | 
		a text 
			title: 'Facade class';
			display: [ :namespace | 
				(namespace classes detect: [:each | 
					'*Facade*' match: each name ]) formattedSourceText ];
			when: [:namespace | self result includes: namespace ]].
	^ browser startOn: self result