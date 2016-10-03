arki
arkiNonPrivateAttributes
|spec window |
spec := REPConcernSpecification on: MooseModel root allModels first.
spec 
	query: 'Non-private attributes' 
	meaning: 'The ArgoUML guidelines say that all attributes must be private'
	as: [:model | model allAttributes select: [ :each | 
			each parentType isStub not and: [ 
				each isPrivate not and: [ each hasClassScope not ]]]].
window := spec open.
window model panes second presentations first selection: spec root children first.
World doOneCycle.
PNGReadWriter putForm: window imageForm onFileNamed: 'arki-argo-non-private-attributes.png'.
window delete