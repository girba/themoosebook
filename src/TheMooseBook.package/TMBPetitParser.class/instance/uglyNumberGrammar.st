as yet unclassified
uglyNumberGrammar
	"self new uglyNumberGrammar parse: '-123.45'"

	| natural number |
	natural := #digit asParser plus.
	number := ($- asParser optional , natural , 
	          ($. asParser , natural) optional).
	^ number