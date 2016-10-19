building
template
	^ '<!DOCTYPE html>
<html>
	<title>Test</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style>
		.nav-pills>li.active>a {
			background-color: transparent;
			color: #337ab7;
		}
		.nav-pills>li.active>a:focus,
		.nav-pills>li.active>a:hover {
			background-color: #eee;
			color: #337ab7;
		}
		.nav-pills>li>a {
			border-radius: 0px;
		}
		.nav-pills {
		   top: 20px;
		   position: fixed;
		}
		/* hide sidebar sub menus by default */
		.nav-pills li .nav-h2 {
		  display: none;
		}
		/* show sub menu when parent is active */
		.nav-pills li.active .nav-h2 {
		  display: block;
		}
		.nav-pills>li.active {
			border-left: 2px solid #ddd;
		}
		.nav-pills>li.active>a {
		  border-left: 6px solid #ddd;
		}
		.nav-pills>li.active li.active a {
		  border-left: 6px solid #eee;
		}
		.nav-pills>li.active li a {
		  border-left: 6px solid transparent;
		}
		ul .nav-h3 {display: none;}
		.nav-pills li a {
			padding-top: 5px;
			padding-bottom: 5px;
			font-size: 14px;
		}
		.nav-pills li li a {
			padding-top: 5px;
			padding-bottom: 5px;
			font-size: 11px;
		}
		img {max-width: 100%;}
		.todo { padding: 20px; background-color: #F9F2F4; }
		.note { padding: 20px; background-color: #DBECFF; }
		figcaption { text-align: center; color: gray; }
		figure { padding: 20px; text-align: center; }
		figure pre { text-align: left; }
		code { background-color: #eee; color: #333; }
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
</html>' asMustacheTemplate
