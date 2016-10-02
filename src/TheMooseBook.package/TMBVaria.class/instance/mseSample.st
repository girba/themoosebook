as yet unclassified
mseSample
^ '(
	(FAMIX.Namespace (id: 1) (name ''aNamespace''))

	(FAMIX.Package (id: 201) (name ''aPackage''))
	(FAMIX.Package (id: 202) (name ''anotherPackage'') (parentPackage (ref: 201)))

	(FAMIX.Class (id: 2) (name ''ClassA'') (container (ref: 1)) (parentPackage (ref: 201)))
	(FAMIX.Method (name ''methodA1'') (signature ''methodA1()'') (parentType (ref: 2)) (LOC 2))
	(FAMIX.Attribute (name ''attributeA1'') (parentType (ref: 2)))
	
	(FAMIX.Class (id: 3) (name ''ClassB'') (container (ref: 1)) (parentPackage (ref: 201)))
	(FAMIX.Inheritance (subclass (ref: 3)) (superclass (ref: 2)))
)'