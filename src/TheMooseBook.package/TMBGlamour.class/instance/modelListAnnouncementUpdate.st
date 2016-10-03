examples
modelListAnnouncementUpdate
"	| window browser |
	browser := self new modelListAnnouncementUpdate.
	window := browser openOn: MooseModel root.
	World doOneCycle.
	PNGReadWriter putForm: window imageForm onFileNamed: 'glamour-announcement-update.png'
"
| browser |
browser := GLMTabulator new.
browser title: 'Model list with implicit update'.
browser column: #list.
browser transmit to: #list; andShow: [:a | 
  a list 
    format: #name;
    updateOn: MooseEntityAdded from: [:model | model announcer ] ].
^ browser 