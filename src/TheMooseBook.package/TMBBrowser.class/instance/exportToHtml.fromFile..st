building
exportToHtml: string fromFile: file
	| writer template |
	writer := TMBHTMLWriter new.
	[writer write: (PRPillarParser parse: string)] 
		on: PRLinkWarning 
		do: [:e | e resume ].

	template := '<!DOCTYPE html>
	<html>
	<title>Test</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	  <style>
	ul.nav-pills {
	      top: 20px;
	      position: fixed;
	}
	/* hide sidebar sub menus by default */
	nav.nav .nav {
	  display: none;
	  font-size:12px;
	}
	/* show sub menu when parent is active */
	nav.nav>.active>ul {
	  display: block;
	}
	.nav-h3 {display: none;}
	.nav-pills>li.active>ul li.active {background-color: yellow;}
	  </style>
	<body data-spy="scroll" data-target="#myScrollspy" data-offset="20">
	<div class="container">
		<div class="row">
			<nav class="col-sm-3" id="myScrollspy">

				{{{index}}}

			</nav>
			<div class="col-sm-9">

				{{{contents}}}  

			</div> 
		</div>
	</div>
	</body>
	</html>' asMustacheTemplate.
	file parent / file basenameWithoutExtension, 'html' writeStreamDo: [ :s | 
		s nextPutAll: (template value: { 
			'index' -> writer writeNavigation.
			'contents' -> writer contents } asDictionary) ].

	"((PRPillarParser parse: self contents) accept: (PRFileInclusion new configuration: (PRPillarConfiguration new baseDirectory: self parent)))"