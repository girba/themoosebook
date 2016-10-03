as yet unclassified
uglyNumberParser
	"self new numberParser parse: '-123.45'"

	| natural number |
	natural := #digit asParser plus.
	number := ($- asParser optional , natural , 
	          ($. asParser , natural) optional).


	natural := #digit asParser plus flatten
	           ==> [:token | token asNumber].
	number := ($- asParser optional , natural , ($. asParser , natural) optional) trim
	          ==> [:token | | integerPart fractionPart positiveNumber |
	               integerPart := token second.
	               fractionPart := token third isNil
	                   ifTrue: [0]
	                   ifFalse: [(token third second * (10 raisedTo: 0 - token third second asString size)) asFloat].
	               positiveNumber := integerPart + fractionPart.
	               token first = $-
	                    ifTrue: [0 - positiveNumber]
	                    ifFalse: [positiveNumber]].
	^ number