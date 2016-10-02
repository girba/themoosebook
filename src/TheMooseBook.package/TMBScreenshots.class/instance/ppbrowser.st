browsers
ppbrowser
	"self new ppbrowser"
	| browser pp |
	pp := PPBrowser new.
	browser := GLMTabulator new.
	pp browseOn: browser.

	browser 
		screenshot: 'ppbrowser.png' 
		on: pp rootModel
		after: [ :b |
			(b panes first port: #selection) 
				value: pp rootModel first ]
