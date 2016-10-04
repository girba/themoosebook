building
editorIn: a forFile: file
	^ (file gtInspectorPillarIn: a)
		act: [ :textPresentation | 
			self exportToHtml: textPresentation text asString fromFile: file ] 
			icon: GLMUIThemeExtraIcons glamorousFolder
			entitled: 'Export to HTML'
			;
		onChangeOfPort: #text act: [ :textPresentation | 
			activeParserProcess ifNotNil: [ :p | p terminate ].
			activeParserProcess := [ | writer |
			writer := TMBHTMLWriter new.
			[ writer
				write: (PRPillarParser parse: textPresentation text asString) ]
				on: PRLinkWarning
				do: [ :e | e resume ].
			(textPresentation pane port: #rootNestedHeader)
				value: writer rootNestedHeader ]
				forkAt: Processor userBackgroundPriority - 1 ]