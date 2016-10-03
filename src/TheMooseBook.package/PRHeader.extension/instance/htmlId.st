*TheMooseBook
htmlId
	^ ('h' , level asString), ((PRTextWriter write: self) copyReplaceAll: String space with: '') asLowercase 