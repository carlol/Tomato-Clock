
# INITIALIZATION SCRIPT

require ['config'], -> 
	require ['Player', 'Tag', 'ConnectionManager'] # ordered components list
		, (components...) -> c.init() for c in components