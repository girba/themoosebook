browsers
basicExamplesBrowser
	| window |
	window := GLMBasicExamples open.
	window inspect.
	"PNGReadWriter putForm: self imageForm onFileNamed: 'basic-examples-browser.png'."
