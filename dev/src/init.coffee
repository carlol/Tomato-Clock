
# INITIALIZATION SCRIPT

require ['config'], -> 
	require ['Player', 'Tag', 'SoundCheck', 'ConnectionManager'] # ordered components list
		, (components...) -> c.init() for c in components