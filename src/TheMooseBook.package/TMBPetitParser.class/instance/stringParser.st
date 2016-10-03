as yet unclassified
stringParser

| string |		
string := $' asParser , 
          ('''''' asParser / $' asParser negate) star ,
          $' asParser.

