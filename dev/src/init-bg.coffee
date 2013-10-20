
# INITIALIZATION BACKGROUND SCRIPT

require ['config'], -> require ['NotificationManager', 'Timer'] 
	, (components...) -> c.init?() for c in components
		
