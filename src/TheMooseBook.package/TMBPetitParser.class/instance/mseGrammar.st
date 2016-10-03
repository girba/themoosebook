as yet unclassified
mseGrammar
"self new mseGrammar parse: '(
		(FAMIX.Namespace (id: 1) (name ''NamespaceA''))
		(FAMIX.ParameterizableClass (id: 2) (name ''ParameterizableClassA'') )
		(FAMIX.ParameterType (id: 5) (name ''A'') (container (ref: 2)))
	)'"
| element open close string natural number boolean primitive simpleName elementName nameReference integerReference reference attributeValue attribute id elements start |

element := PPUnresolvedParser new.
open := $( asParser trim.
close := $) asParser trim.

string := ($' asParser , 
          ('''''' asParser / $' asParser negate) star flatten ,
          $' asParser) trim.
natural := #digit asParser plus flatten.
number := ($- asParser optional , natural , 
          ($. asParser , natural) optional) flatten trim.
boolean := ('true' asParser / 'false' asParser) flatten trim.
primitive := string / number / boolean.
simpleName := #word asParser star flatten.
elementName := (simpleName , ($. asParser , simpleName) optional) token trim.

nameReference := (open , 'ref:' asParser , elementName , close) token.
integerReference := (open , 'ref:' asParser , natural trim , close) token.
reference := integerReference / nameReference.
attributeValue := (primitive / reference / element) star.
attribute := (open , simpleName , attributeValue , close) trim.
id := (open , 'id:' asParser , natural trim , close) trim.
element def: ( (open , elementName , id optional , attribute star , close) trim).
elements := open , element star , close.
start := elements end.
^ start