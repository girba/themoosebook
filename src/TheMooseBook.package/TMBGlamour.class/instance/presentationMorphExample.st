examples
presentationMorphExample
"| window browser |
	browser := self new presentationMorphExample.
	window := browser openOn: MooseModel root allModels anyOne allModelClasses.
	(browser panes first port: #selection) value: (MooseModel root allModels anyOne allClasses entityNamed: #'org::argouml::cognitive::Critic').
	World doOneCycle.
	window inspect.
	PNGReadWriter putForm: window imageForm onFileNamed: 'glamour-morph-presentation.png'"

| browser |
browser := GLMTabulator new.
browser title: 'Class Inspector'.
browser column: #classes; column: #inspector span: 2.
browser showOn: #classes; using: [
  browser list
    title: 'Classes' ].
browser showOn: #inspector; from: #classes; using: [
  browser morph 
    title: [ :class | 'Inspector on ', class name]; 
    display: [ :class | 
    PanelMorph new
      layoutPolicy: ProportionalLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
      addAllMorphs: ( Inspector openAsMorphOn: class ) paneMorphs;
      yourself ] ].
^ browser