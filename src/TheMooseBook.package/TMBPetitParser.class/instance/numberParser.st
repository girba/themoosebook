as yet unclassified
numberParser
	"self new numberParser parse: '-123'"
	| natural decimalPart positiveNumber negativeNumber number |
	natural := #digit asParser plus flatten 
		==> [:token | token asNumber].
	decimalPart := ($. asParser , natural) 
		==> [:token | (token at: 2) * (10 raisedTo: (0- (token at: 2) asString size)) asFloat ].
	positiveNumber := natural , decimalPart optional 
		==> [:token | (token at: 1) + ((token at: 2) ifNil: [0]) ].
	negativeNumber := $- asParser , positiveNumber 
		==> [:token | 0 - (token at: 2)] .
	number := positiveNumber / negativeNumber.
	^ number