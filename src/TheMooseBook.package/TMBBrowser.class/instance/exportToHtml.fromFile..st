building
exportToHtml: string fromFile: file
	| writer template root |
	writer := TMBHTMLWriter new.
	root := PRPillarParser parse: string.
	root accept: (TMBIncluderFlattener new baseDirectory: file parent).
	[ writer write: root ]
		on: PRLinkWarning
		do: [ :e | e resume ].
	template := self template.
	file parent / file basenameWithoutExtension , 'html'
		writeStreamDo: [ :s | 
			s
				nextPutAll:
					(template
						value:
							{('index' -> writer writeNavigation).
							('contents' -> writer contents)} asDictionary) ]

	"((PRPillarParser parse: self contents) accept: (PRFileInclusion new configuration: (PRPillarConfiguration new baseDirectory: self parent)))"