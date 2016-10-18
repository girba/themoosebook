baseline
baseline: spec
	<baseline>
	spec for: #common do: [ 
		spec
			project: 'Pillar' with: [
				spec
					className: #ConfigurationOfPillar;
					versionString: #'development';
					repository: 'http://smalltalkhub.com/mc/Pier/Pillar/main/' ];	
			project: 'Mustache' with: [
				spec
					className: #ConfigurationOfMustache;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/NorbertHartl/Mustache/main/' ];	
			package: 'TheMooseBook' with: [ spec requires: #(Pillar Mustache) ] ]