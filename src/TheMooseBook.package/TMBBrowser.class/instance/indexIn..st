building
indexIn: a
	^ a tree
		title: 'Index';
		display: [ :root | root children ];
		children: #children;
		format: [ :header | PRTextWriter write: header header ];
		allExpanded.