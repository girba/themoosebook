visualizations
multiplicationConstellation

	| multiplications view window |
	multiplications := MooseModel root allModels last allMultiplications select: [:each |
				(each duplications size > 1) or: [
					each multiplyingEntities anySatisfy: [:entity |
						entity allMultiplications size > 1 ]] ].
	view := MOViewRenderer new.
	multiplications viewConstellationOn: view.
	window := view open.
	PNGReadWriter putForm: view canvas imageForm onFileNamed: 'visualization-multiplication-constellation.png'.
	window delete