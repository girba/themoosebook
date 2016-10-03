visiting
writeNavigation
	"This is a post processing step and 
	it should be called only after traversing the whole document"
	
	| customCanvas |
	^ String streamContents: [ :s |
		customCanvas := PRHTMLCanvas new setStream: (PROutputStream on: s).
		customCanvas newLine.
		customCanvas tag 
			name: 'ul';
			parameterAt: 'class' put: 'nav nav-pills nav-stacked';
			with: [ 
				rootHeader children do: [ :each |
					self writeNavigationFor: each on: customCanvas ] ] ]