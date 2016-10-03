private
build: spec
	spec label: 'ArgoUML Report'.

	spec composite: 'ArgoUML specific design problems' meaning: '' with: [
		spec 
			query: 'Non-private attributes' 
			meaning: 'The ArgoUML guidelines say that all attributes must be private'
			as: [:m | m allAttributes select: [ :each | 
					each parentType isStub not and: [ 
						each isPrivate not and: [ each hasClassScope not ]]]].
		spec
			query: 'Deprecated classes still in use'
			meaning: 'Deprecated classes should not be used anymore'
			as: [:m | m allModelClasses select: [ :each | 
					(each isAnnotatedWith: 'Deprecated') and: [ 
						(each clientClasses reject: [:e | e = each]) notEmpty ]]].
		spec
			query: 'Deprecated methods still in use'
			meaning: 'Deprecated methods should not be used anymore'
			as: [:m | m allMethods select: [ :each | 
					(each isAnnotatedWith: 'Deprecated') and: [ 
						(each invokingClasses reject: [:e | e = each parentType ]) notEmpty ]]]
	].

	spec composite: 'ArgoUML specific naming problems' meaning: '' with: [
		spec 
			query: 'Classes with too long name' 
			meaning: 'The ArgoUML guidelines say that a class should not have a name with more than 25 characters'
			as: [:m | m allModelClasses select: [ :each | 
					each nameLength > 25 ] ].
	].

	spec composite: 'Generic design problems' meaning: 'General ' with: [
		spec 
			query: 'God classes' 
			meaning: 'God Classes are detected based on the rule from the Object-Oriented Metrics in Practice book'
			as: [:m | m allModelClasses select: #isGodClass ].	
		spec 
			query: 'Data classes' 
			meaning: 'Data Classes are detected based on the rule from the Object-Oriented Metrics in Practice book'
			as: [:m | m allModelClasses select: #isDataClass ]
		].
	spec concern: TMBArgoUMLFacadeMap new