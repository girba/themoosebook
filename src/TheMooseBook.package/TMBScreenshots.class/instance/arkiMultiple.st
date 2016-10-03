arki
arkiMultiple
|spec window |
spec := REPConcernSpecification on: MooseModel root allModels first.
	spec label: 'ArgoUML Report'.

	spec composite: 'ArgoUML design problems' meaning: '' with: [
		spec 
			query: 'Non-private attributes' 
			meaning: 'The ArgoUML guidelines say that all attributes must be private'
			as: [:model | model allAttributes select: [ :each | 
					each parentType isStub not and: [ 
						each isPrivate not and: [ each hasClassScope not ]]]].
		spec
			query: 'Deprecated classes still in use'
			meaning: 'Deprecated classes should not be used anymore'
			as: [:model | model allModelClasses select: [ :each | 
					(each isAnnotatedWith: 'Deprecated') and: [ 
						(each clientClasses reject: [:e | e = each]) notEmpty ]]].
		spec
			query: 'Deprecated methods still in use'
			meaning: 'Deprecated methods should not be used anymore'
			as: [:model | model allMethods select: [ :each | 
					(each isAnnotatedWith: 'Deprecated') and: [ 
						(each invokingClasses reject: [:e | e = each parentType ]) notEmpty ]]]
	].

	spec composite: 'ArgoUML naming problems' meaning: '' with: [
		spec 
			query: 'Classes with too long name' 
			meaning: 'A class should not have a name with more than 25 characters'
			as: [:model | model allModelClasses select: [ :each | 
					each nameLength > 25 ] ].
	].
window := spec open.
window model panes second presentations first selection: spec root children first children last.
window model panes second presentations first selection: spec root children last children last.
World doOneCycle.
PNGReadWriter putForm: window imageForm onFileNamed: 'arki-argo-multiple.png'.
window delete