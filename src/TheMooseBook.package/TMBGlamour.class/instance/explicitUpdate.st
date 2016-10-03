examples
explicitUpdate
"	| window browser |
	browser := self new explicitUpdate.
	window := browser openOn: MooseModel root.
	World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: 'glamour-explicit-update.png'
"
| browser |
browser := GLMTabulator new.
browser title: 'Model list with manual update'.
browser column: #list.
browser transmit to: #list; andShow: [:a | 
  a list 
    act: [:list | list update]
      icon: GLMUIThemeExtraIcons glamorousRefresh
      entitled: 'Update';
    format: #name ].
^ browser 