
# INITIALIZATION BACKGROUND SCRIPT

require ['config'], -> require ['NotificationManager', 'Timer'] 
	, (components...) -> console.log c; c.init?() for c in components
		
