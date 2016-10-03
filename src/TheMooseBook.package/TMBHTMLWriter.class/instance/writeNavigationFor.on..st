visiting
writeNavigationFor: aNestedHeader	on: customCanvas
	customCanvas newLine.
	customCanvas tag 
		name: 'li';
		with: [ 
			customCanvas newLine.
			customCanvas tag
				name: 'a';
				parameterAt: 'href' put: '#', aNestedHeader header htmlId;
				with: (PRTextWriter write: aNestedHeader header).
			aNestedHeader children notEmpty ifTrue: [
				customCanvas newLine.
				customCanvas tag
					name: 'ul';
					parameterAt: 'class' put: 'nav nav-h', (aNestedHeader header level + 1) asString;
					with: [ 
						aNestedHeader children do: [ :each | 
							self writeNavigationFor: each on: customCanvas ] ] ] ]